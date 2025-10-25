# app/admin/dashboard.rb
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: "Dashboard"

  content title: "Dashboard" do
    columns do
      column do
        panel "Quick Stats" do
          ul do
            li "Total customers: #{Customer.count}"
            li "Missing email: #{Customer.where(email: [nil, '']).count}"
            li "Alphabetized first: #{Customer.order(:full_name).limit(1).pluck(:full_name).first || '—'}"
          end
        end

        panel "Recently added (5)" do
          table_for Customer.order(created_at: :desc).limit(5) do
            column(:full_name) { |c| c.full_name }
            column(:phone_number)
            column(:email) { |c| c.email.presence || '—' }
            column(:created_at)
            column("View") { |c| link_to "Show", admin_customer_path(c) }
          end
          div do
            strong { link_to "Manage all customers", admin_customers_path }
          end
        end
      end

      column do
        panel "Customers missing email (5)" do
          table_for Customer.where(email: [nil, ""]).order(:full_name).limit(5) do
            column(:full_name)
            column(:phone_number)
            column("Edit") { |c| link_to "Edit", edit_admin_customer_path(c) }
          end
          div do
            strong { link_to "See full list", admin_customers_path(q: { email_null: "1" }) }
          end
        end

        panel "Shortcuts" do
          ul do
            li link_to "New customer", new_admin_customer_path
            li link_to "Admin users", admin_admin_users_path
          end
        end
      end
    end
  end
end
