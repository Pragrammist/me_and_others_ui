pub type Msg {
  UserClickThoughtHeader(msg_type: UserClickThoughtHeaderType)
}

pub type UserClickThoughtHeaderType {
  ThoughtList
  AddThought
  SearchByAttachment
  SearchByThoughtContent
  ShowThoughtStickers
  ShowThoughtGifs
  ShowThoughtFiles
  ShowThoughtMedia
}
