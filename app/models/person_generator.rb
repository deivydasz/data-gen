class PersonGenerator < ApplicationRecord

  serialize :first_names, Array
  serialize :last_names, Array
  serialize :addresses, Array

  def complete
    update(status: 'completed')
    SenderWorker.perform_async(total_count)
  end

end
