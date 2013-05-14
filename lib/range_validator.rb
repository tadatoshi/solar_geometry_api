class RangeValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    if BigDecimal(record.send(attribute).to_s) < options[:min_degree] || BigDecimal(record.send(attribute).to_s) > options[:max_degree]
      record.errors.add(attribute, "#{I18n.t("solar_position.must_be")} #{I18n.t("solar_position.between_and", :min_degree => options[:min_degree], :max_degree => options[:max_degree])}") 
    end
  end

end