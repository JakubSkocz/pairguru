class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:title, "brackets weren't closed") unless is_closed(record.title)
    record.errors.add(:title, 'brackets are empty') unless not_empty(record.title)    
  end

  private 

   def is_closed(record)
      check_list = []
      brackets = {'(' => ')', '[' => ']', '{' => '}'}
      title_tab = record.split('')
      open_bracket = ['(', '[', '{']
      close_bracket = [')', ']', '}']
      title_tab.each do |c|
        if open_bracket.include? c
          check_list << c
        elsif close_bracket.include? c
          return false if check_list.empty? || ( brackets[check_list.pop] != c) 
        end
      end
      return check_list.empty?
    end
    
    def not_empty(record)
      check_list = {}
      brackets = {'(' => ')', '[' => ']', '{' => '}'}
      title_tab = record.split('')
      open_bracket = ['(', '[', '{']
      close_bracket = [')', ']', '}']
      title_tab.each_with_index do |c, i|
        if open_bracket.include? c
          check_list.merge!(i => c)
        elsif close_bracket.include? c
          return false if check_list.keys.last == i - 1
        end
      end
      return true
    end
end