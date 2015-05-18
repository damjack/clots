require 'clot/version'
require 'clot/base_drop'
require 'clot/content_for'
require 'clot/date_tags'
require 'clot/deprecated'
require 'clot/form_for'
require 'clot/form_tag'
require 'clot/model_date_tags'
require 'clot/model_form_tags'
require 'clot/no_model_form_tags'
require 'clot/url_filters'
require 'clot/yield'

require 'liquid'
require 'solid'
require 'active_support/concern'

module Clot
	autoload :BaseDrop,					'clot/base_drop'
	autoload :ContentFor,				'clot/content_for'
	autoload :Deprecated,				'clot/deprecated'
	autoload :DateTags,					'clot/date_tags'
	autoload :FormFor,					'clot/form_for'
	autoload :FormTag,					'clot/form_tag'
	autoload :ModelDateTags,		'clot/model_date_tags'
	autoload :ModelFormTags,		'clot/model_form_tags'
	autoload :NoModelFormTags,	'clot/no_model_form_tags'
	autoload :UrlFilters,				'clot/url_filters'
	autoload :Yield,						'clot/yield'
	autoload :VERSION,					'clot/version'

	if defined?(Rails) # Rails only features
		autoload :BaseDrop,				'clot/base_drop'
		require 'clot/engine'
	end

	# SyntaxError = Class.new(Liquid::SyntaxError)
end

Liquid::Template.register_filter Clot::UrlFilters
Liquid::Template.register_filter Clot::LinkFilters
Liquid::Template.register_filter Clot::FormFilters

Liquid::Template.register_tag('error_messages_for', Clot::ErrorMessagesFor)
Liquid::Template.register_tag('form_for', Clot::LiquidFormFor)
Liquid::Template.register_tag('if_content_for', Clot::IfContentFor)
Liquid::Template.register_tag('form_tag', Clot::FormTag)

Liquid::Template.register_tag('select_tag', Clot::SelectTag)
Liquid::Template.register_tag('text_field_tag', Clot::TextFieldTag)
Liquid::Template.register_tag('email_field_tag', Clot::EmailFieldTag)
Liquid::Template.register_tag('hidden_field_tag', Clot::HiddenFieldTag)
Liquid::Template.register_tag('file_field_tag', Clot::FileFieldTag)
Liquid::Template.register_tag('text_area_tag', Clot::TextAreaTag)
Liquid::Template.register_tag('submit_tag', Clot::SubmitTag)
Liquid::Template.register_tag('label_tag', Clot::LabelTag)
Liquid::Template.register_tag('check_box_tag', Clot::CheckBoxTag)
Liquid::Template.register_tag('password_field_tag', Clot::PasswordFieldTag)

Liquid::Template.register_tag('text_field', Clot::TextField)
Liquid::Template.register_tag('email_field', Clot::EmailField)
Liquid::Template.register_tag('phone_field', Clot::PhoneField)
Liquid::Template.register_tag('number_field', Clot::NumberField)
Liquid::Template.register_tag('text_area', Clot::TextArea)
Liquid::Template.register_tag('label', Clot::Label)
Liquid::Template.register_tag('check_box', Clot::CheckBox)
Liquid::Template.register_tag('collection_select', Clot::CollectionSelect)
Liquid::Template.register_tag('file_field', Clot::FileField)
Liquid::Template.register_tag('password_field', Clot::PasswordField)

Liquid::Template.register_tag('select_second', Clot::SelectSecond)
Liquid::Template.register_tag('select_minute', Clot::SelectMinute)
Liquid::Template.register_tag('select_hour', Clot::SelectHour)

Liquid::Template.register_tag('select_day', Clot::SelectDay)
Liquid::Template.register_tag('select_month', Clot::SelectMonth)
Liquid::Template.register_tag('select_year', Clot::SelectYear)

Liquid::Template.register_tag('select_date', Clot::SelectDate)
Liquid::Template.register_tag('select_time', Clot::SelectTime)
Liquid::Template.register_tag('select_datetime', Clot::SelectDatetime)

Liquid::Template.register_tag('date_select', Clot::DateSelect)
Liquid::Template.register_tag('time_select', Clot::TimeSelect)
Liquid::Template.register_tag('datetime_select', Clot::DatetimeSelect)