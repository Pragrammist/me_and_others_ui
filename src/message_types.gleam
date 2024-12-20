pub type Msg {
  UserClickThoughtPanel(msg_type: UserClickThoughtPanelType)
}

pub type UserClickThoughtPanelType {
  ThoughtList
  AddThought
  SearchByAttachment
  SearchByThoughtContent
}
