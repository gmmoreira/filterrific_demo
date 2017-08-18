class RegisteredStudent
  include Sneakers::Worker

  from_queue(:'corleone.registered-students',
             routing_key: 'student.registered',
             exchange: 'amq.direct',
             manual_ack: true,
             queue_options: {
               durable: true,
               auto_delete: false
             },
             prefetch: 1)

  def work(data)
    Rails.logger.info("New student detected")
    Rails.logger.info("Received payload: #{data}")
    student_params = ActiveSupport::JSON.decode(data)

    ActiveRecord::Base.connection_pool.with_connection do
      student = Student.new(student_params)
      student.country = Country.first

      if student.save
        Rails.logger.info("Student #{student.first_name} created successfully!")
        ack!
      else
        Rails.logger.error("Error creating student.")
        student.errors.each(&Rails.logger.method(:error))
        requeue!
      end
    end
  end

  def work_with_params(data, delivery_info, metadata)
    Rails.logger.info("'work_with_params takes precedence when it exists")
    work(data)
  end
end
