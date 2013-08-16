ActiveAdmin.register_page "Dashboard" do
  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Products" do
          table_for Invoice.order("created_at desc").limit(5) do
            column :invoice_number do |invoice|
              link_to invoice.invoice_number, [:admin, invoice]
            end
            column :customer
            column :created_at
          end
          strong { link_to "View All Invoices", admin_invoices_path }
        end
      end

# Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end


    # end
  end # content
  end
end

