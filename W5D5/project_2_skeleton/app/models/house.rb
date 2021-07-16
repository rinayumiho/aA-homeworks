class House < ApplicationRecord
  has_many :gardeners,
    class_name: 'Gardener',
    foreign_key: :house_id,
    primary_key: :id

  has_many :plants,
    through: :gardeners,
    source: :plants

  def n_plus_one_seeds
    plants = self.plants
    seeds = []
    plants.each do |plant|
      seeds << plant.seeds
    end

    seeds
  end

  def better_seeds_query
    # TODO: your code here
    gardeners = self.gardeners.includes(:plants)
    seeds = []
    gardeners.each do |gardener|
      tmp = []
      plants = gardener.plants.includes(:seeds)
      plants.each { |plant| tmp << plant.seeds }
      seeds << tmp
    end
    seeds
  end
end
