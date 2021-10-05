module Visible
extend ActiveSupport::Concern

    VALID_STATUSES = ['Admin', 'User']
    
    included do
        validates :role, inclusion: { in: VALID_STATUSES }
    end

    class_methods do
        def admin_count
            where(role: 'Admin').count
        end
    end

    class_methods do
        def user_count
            where(role: 'User').count
        end
    end

    def archived?
        role == 'User'
    end
end