class Post < ActiveRecord::Base
    belongs_to :user
    has_many :post_tags
    has_many :tags, through: :post_tags

    validates :name, :content, presence: true

    # accepts_nested_attributes_for :tags

    def tags_attributes( tag_attributes )
        if !tag_attributes.values.include?("")
            tag_attributes.each do |tag_attribute|
                tag = Tag.find_or_create_by( tag_attribute )
                self.tags << tag
            end
        end
    end
end
