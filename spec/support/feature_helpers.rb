module FeatureHelpers
	def t(*args)
		I18n.t(*args)
	end

	def title(scope)
		t(scope, scope: 'title')
	end

	def label(scope)
		t(scope, scope: 'form.labels')
	end

	def submit(scope)
		t('form.action.submit', resource: scope)
	end

	def link(scope)
		t(scope, scope: 'link')
	end
end

Rspec.configure do |config|
	config.include FeatureHelpers, type: :feature
end