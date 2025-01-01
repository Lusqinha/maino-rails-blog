# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, "\\1en"
#   inflect.singular /^(ox)en/i, "\\1"
#   inflect.irregular "person", "people"
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym "RESTful"
# end

ActiveSupport::Inflector.inflections(:'pt_BR') do |inflect|
  inflect.clear

  inflect.plural(/$/, "s")
  inflect.plural(/(r|z|n|l)$/i, '\1es')
  inflect.plural(/al$/i, "ais")
  inflect.plural(/el$/i, "eis")
  inflect.plural(/ol$/i, "ois")
  inflect.plural(/ul$/i, "uis")
  inflect.plural(/il$/i, "is")
  inflect.plural(/m$/i, "ns")
  inflect.plural(/^(japon|escoc|ingl|dinamarqu|fregu|portugu)ês$/i, '\1eses')
  inflect.plural(/^(|g)ás$/i, '\1ases')
  inflect.plural(/ão$/i, "ões")
  inflect.plural(/^(irm|m)ão$/i, '\1ãos')
  inflect.plural(/^(alem|c|p)ão$/i, '\1ães')

  inflect.plural(/ao$/i, "oes")
  inflect.plural(/^(irm|m)ao$/i, '\1aos')
  inflect.plural(/^(alem|c|p)ao$/i, '\1aes')

  inflect.singular(/s$/i, "")
  inflect.singular(/es$/i, "")
  inflect.singular(/ais$/i, "al")
  inflect.singular(/eis$/i, "el")
  inflect.singular(/ois$/i, "ol")
  inflect.singular(/uis$/i, "ul")
  inflect.singular(/is$/i, "il")
  inflect.singular(/ns$/i, "m")
  inflect.singular(/sses$/i, "sse")
  inflect.singular(/^(.*[^s]s)es$/i, '\1')
  inflect.singular(/ães$/i, "ão")
  inflect.singular(/ões$/i, "ão")
  inflect.singular(/ãos$/i, "ão")
  inflect.singular(/ões$/i, "ão")
  inflect.singular(/eses$/i, "ês")
  inflect.singular(/ases$/i, "ás")
end
