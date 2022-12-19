class CreatedMissionPlanetDataSerializer < ActiveModel::Serializer
  attributes :planet

  # has_one :planet, serializer: PlanetSerializer
  has_one :planet


end
