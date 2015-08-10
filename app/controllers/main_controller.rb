class MainController < ApplicationController
    
    def view

        @board = Mosaicdb.all
        @image = Image.all
        @reply = Reply.all
        
    end
    
    def email_send
        title = params[:title]
        if params[:from].blank?
            from = "익명"
        else
            from = params[:from]
        end
            
        content = from+"님께서 Mosaicgram의 #"+params[:titletag]+" 페이지를 보내셨습니다. "+"http://mosaicgram-jsmichael.c9.io/main/view_tag/?titletag="+params[:titletag]+"  "+from+"님의 메세지: "+params[:content]
                
        to = params[:to]
        cc = params[:cc]
        
        Anycall.welcome_email(to, cc, title, content).deliver_now
        redirect_to :controller => 'main', :action => 'view_tag', :titletag => params[:titletag], :check =>'sent'
        
    end
    
    def delete
        delete_image = Image.find(58)
        delete_image.destroy
        
    end
        
    
    def view_all

        @image = Image.all
    
    end
    
    def view_tag
    
        @titletag_detail = Mosaicdb.where(:titletag => params[:titletag])
        
        @board = Mosaicdb.all
        @image = Image.all
        @reply = Reply.all
        
    end
    
    
    def new_titletag
        
        new_post_check = Mosaicdb.where(:titletag => params[:titletag])
        #원래는 new_post_check = Mosaicdb.find_by_titletag(params[:titletag])로 썼었는데 작동 안함..
        
        if new_post_check.empty?
            new_post = Mosaicdb.new
            new_post.titletag = params[:titletag]
            new_post.save
            new_image = Image.new
            new_image.image = params[:image_file]
            new_image.mosaicdb_id = Mosaicdb.last.id
            new_image.mosaicdb_id_string = params[:titletag]
            new_image.save
            new_image = Image.new
            new_image.image = params[:image_file2]
            new_image.mosaicdb_id = Mosaicdb.last.id
            new_image.mosaicdb_id_string = params[:titletag]
            new_image.save
            new_image = Image.new
            new_image.image = params[:image_file3]
            new_image.mosaicdb_id = Mosaicdb.last.id
            new_image.mosaicdb_id_string = params[:titletag]
            new_image.save
            redirect_to :contorller => 'main', :action => 'view_tag', :titletag => new_post.titletag, :check =>'upload'
        else
        #    new_image = Image.new
        #    new_image.image = params[:image_file]
        #    finding_id = Mosaicdb.where(:titletag => params[:titletag])
        #    new_image.mosaicdb_id = finding_id.id
        #    new_image.save
            redirect_to :controller => 'main', :action => 'view_tag', :titletag => params[:titletag], :error =>'same'
        end
    end


    def add_image
        
        new_image = Image.new
        new_image.image = params[:image_file]
        new_image.mosaicdb_id = params[:id]
        new_image.mosaicdb_id_string = Mosaicdb.find(params[:id]).titletag
        new_image.save
        new_image = Image.new
        new_image.image = params[:image_file2]
        new_image.mosaicdb_id = params[:id]
        new_image.mosaicdb_id_string = Mosaicdb.find(params[:id]).titletag
        new_image.save
        new_image = Image.new
        new_image.image = params[:image_file3]
        new_image.mosaicdb_id = params[:id]
        new_image.mosaicdb_id_string = Mosaicdb.find(params[:id]).titletag
        redirect_to :back
        
    end
    
    
    def write_reply
        
        new_reply = Reply.new
        new_reply.username = params[:username]
        new_reply.content = params[:content]
        new_reply.mosaicdb_id = params[:id]
        new_reply.mosaicdb_id_string = Mosaicdb.find(params[:id]).titletag
        new_reply.save
        redirect_to :back
        
    end
    
end