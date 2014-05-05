module Tasks::Concerns::Verifiable
  extend ActiveSupport::Concern

  included do
    has_one :verification, as: :verifiable, class_name: '::Tasks::Taskables::Verification', dependent: :destroy
    has_one :task, through: :verification, class_name: '::Tasks::Task'
    has_many :confirmations, through: :verification, class_name: '::Tasks::Taskables::Verification::Confirmation'
  end
end
