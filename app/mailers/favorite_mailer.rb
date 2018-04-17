class FavoriteMailer < ApplicationMailer
    default from: "emnoyes@gmail.com"

    def new_comment(user, post, comment)
        headers["Message-ID"] = "<comments/#{comment.id}@young-scrubland-59194.example>"
        headers["In-Reply-To"] = "<post/#{post.id}@young-scrubland-59194.example>"
        headers["References"] = "<post/#{post.id}@young-scrubland-59194.example>"

        @user = user
        @post = post
        @comment = comment

        mail(to: user.email, subject: "New comment on #{post.title}")
    end

    def new_post(post)
        headers["Message-ID"] = "<posts/#{post.id}@young-scrubland-59194.example>"
        headers["In-Reply-To"] = "<post/#{post.id}@young-scrubland-59194.example>"
        headers["References"] = "<post/#{post.id}@young-scrubland-59194.example>"

        @post = post

       mail(to: post.user.email, subject: "New comment on #{post.title}")
     end
end
