class CommentMailer < ApplicationMailer
  def new_comment(place)
    @place = place
    mail to: @place.owner.email,
        subject: 'you have a new comment!'
  end
end