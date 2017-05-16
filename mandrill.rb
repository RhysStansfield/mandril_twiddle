require 'mandrill'
require 'pry'

def send_email(name: 'Derpy')
  mandrill = Mandrill::API.new(ENV['MANDRILL_KEY'])
  template_name = 'test-email-template'
  template_content = []
  message = {
    'headers' => { 'Reply-To' => ENV['MANDRILL_ADMIN_EMAIL'] },
    'from_email' => ENV['MANDRILL_ADMIN_EMAIL'],
    'from_name' => 'Rhysy Boi',
    'to' => [
      {
        'type' => 'to',
        'email' => ENV['MANDRILL_TARGET_EMAIL'],
        'name' => name
      }
    ],
    'subject' => 'Sent From Mandrill!'
  }
  async = false

  mandrill.messages.send_template(
    template_name,
    template_content,
    message,
    async
  )
end

binding.pry
