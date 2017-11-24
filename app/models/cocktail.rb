class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true
  has_attachment :photo

  def path
    if photo.present?
      photo.path
    else
      "https://i1.wp.com/quaff-magazine.com/wp-content/uploads/2017/06/recette-cocktail-kula-negroni-quaff-4.jpg"
    end
  end
end


