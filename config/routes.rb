# frozen_string_literal: true

LetterOpenerWeb::Engine.routes.draw do
  delete_pseudo_method_constraint = ->(req) { req.params['_method'] == 'delete' }

  delete 'clear'                 => 'letters#clear', as: :clear_letters
  post 'clear'                   => 'letters#clear', constraints: delete_pseudo_method_constraint
  delete ':id'                   => 'letters#destroy', as: :delete_letter
  post ':id'                     => 'letters#destroy', constraints: delete_pseudo_method_constraint
  get    '/'                     => 'letters#index',    as: :letters
  get    ':id(/:style)'          => 'letters#show',     as: :letter
  get    ':id/attachments/:file' => 'letters#attachment'
end
