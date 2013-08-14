class CustomerMailer < ActionMailer::Base
  default from: "r_many17@yahoo.com"

  def email_invoice(invoice)
    @invoice = invoice
    mail(:subject => 'Your Invoice', :to => invoice.customer.email) do |format|
      format.html
      format.pdf do
        require 'wkhtmltopdf-heroku'
        attachments['invoice.pdf'] = render_to_string(:pdf => "print_invoice", :disable_smart_shrinking => false,
                                                      :template => 'admin/invoices/print_invoice.html.erb', :layout => false,
                                                       :header => {:font_size => '8', :right => '[page] of [toPage]'},
                                                        :footer => {:font_size => '8', :right => 'Generated by constructionsupport.co.uk'})

      end
    end
  end
end