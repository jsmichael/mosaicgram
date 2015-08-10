class Anycall < ApplicationMailer
    def welcome_email addon_to, addon_cc, addon_title, addon_content
        
        mail from: "mosaicgram@fake_email.ipnida",
               to: addon_to,
               cc: addon_cc,
          subject: addon_title,
             body: addon_content
             
    end
  
    
end
