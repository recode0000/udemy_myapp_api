class EmailValidator < ActiveModel::EachValidator
  MAXIMUM_LENGTH = 255
  FORMAT_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  def validate_each record, attribute, value
    if value.length > MAXIMUM_LENGTH
      record.errors.add(attribute, :too_long, count: MAXIMUM_LENGTH)
    end

    # 正規表現にマッチしない場合はnilを返す
    if (value =~ FORMAT_REGEX).nil?
      record.errors.add(attribute, :invalid)
    end

    if record.is_email_active?
      record.errors.add(attribute, :taken)
    end
  end
end