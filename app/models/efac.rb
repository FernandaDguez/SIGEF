class Efac < ApplicationRecord
    belongs_to :user
    has_many :instructors, inverse_of: :efac, dependent: :destroy
    accepts_nested_attributes_for :instructors, allow_destroy: true

    enum state: [ :editing, :waiting, :aproved, :rejected ]

    validates :name, presence: true
    validates :modality, presence: true
    validates :objectives, presence: true
    validates :content_type, presence: true
    validates :eval_method, presence: true
    validates :duration, presence: true
    validates :resources, presence: true
    validates :references, presence: true
    validates :utility, presence: true
    validates :participation_requirements, presence: true
    validates :acreditation_requirements, presence: true
    validates :operative_conditions, presence: true
    validates :resources_availability, presence: true
    validates :fee, presence: true
    validates :content, presence: true

    before_save do
        if self.fee < 0
            errors.add(:error, ". Cuota inválida.")
            raise ActiveRecord::RecordInvalid.new(self)
        end
        if self.content_type.eql?("Taller") and self.duration < 10
            errors.add(:error, ". Los talleres deben tener una duración mínima de 10 horas.")
            raise ActiveRecord::RecordInvalid.new(self)
        elsif self.content_type.eql?("Diplomado") and self.duration < 120
            errors.add(:error, ". Los diplomados deben tener una duración mínima de 120 horas.")
            raise ActiveRecord::RecordInvalid.new(self)
        elsif self.content_type.eql?("Curso") and self.duration < 20
            errors.add(:error, ". Los cursos deben tener una duración mínima de 20 horas.")
        elsif self.content_type.eql?("Programa especial") and self.duration < 20
            errors.add(:error, ". Los programas especiales deben tener una duración mínima de 20 horas.")
        else
        end
    end
end
