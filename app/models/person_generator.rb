class PersonGenerator < ApplicationRecord

  serialize :first_names, Array
  serialize :last_names, Array
  serialize :addresses, Array

end
