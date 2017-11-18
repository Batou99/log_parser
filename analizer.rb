class Analyzer

  def initialize(log_entries)
    @log_entries = log_entries
  end

  def aggregate(unique: false, order: :desc)
    modifier = sort_modifier(order)

    @log_entries.
      fold({}) do |acc, entry|
        acc[entry.url] = (acc[entry.url] || []) << entry.ip
      end.
      map { |k, v| [k, unique ? v.uniq.count : v.count] }.
      sort { |a, b| a[1] <=> modifier*b[1] }
  end


  private
  def sort_modifier(sort_order)
    case sort_order
    when :asc
      1
    when :desc -1
    else
      raise ArgumentError("Order param must be :asc or :desc")
    end
  end

end
