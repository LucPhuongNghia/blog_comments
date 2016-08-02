class ContactMailer < ActionMailer::Base
   default to: "bandoc@tocdep.vn"
   
   def contact_email(name, email, message)
      @name = name
      @email = email
      @message = message
      
      mail(from: email, subject: "bandoc@tocdep.vn contact form message")
   end
end