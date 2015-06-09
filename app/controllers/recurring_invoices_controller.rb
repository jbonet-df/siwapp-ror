class RecurringInvoicesController < CommonsController

  def generate
    # Generates pending invoices according to date
    @recurring = self.delayed
    @recurring.each do |actual|
      # generate an Invoice for the actual recurring_invoice
    end
    redirect_to(:action => 'index')
  end

  def delayed
    # Gets recurring invoices that should be executed
    @c = RecurringInvoice.status(1)
  end

  protected

  def set_listing(instances)
    @recurring_invoices = instances
  end

  def set_instance(instance)
    @recurring_invoice = instance
  end

  def get_instance
    @recurring_invoice
  end

  def recurring_invoice_params
    [
      :series_id,

      :customer_identification,
      :customer_name,
      :customer_email,

      :status,
      :days_to_due,
      :invoicing_address,
      :draft,
      :starting_date,
      :finishing_date,
      :period,
      :period_type,
      :max_occurrences,

      :tag_list,

      items_attributes: [
        :id,
        :description,
        :quantity,
        :unitary_cost,
        :discount,
        {:tax_ids => []},
        :_destroy
      ]
    ]
  end

end
