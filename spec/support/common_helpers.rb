module CommonHelpers
  def set_user_to_session(user)
    allow_any_instance_of(ActionDispatch::Request)
      .to receive(:session).and_return(user_id: user.id)
  end
end