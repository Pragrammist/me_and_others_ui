pub type Model {
  AccountPageState(
    header_state: AccountHeaderState,
    body_state: AccountBodyState,
  )
}

pub type AccountHeaderState {
  ShowThoughtSearchAttachmentDetails
  ShowThoughtSearchInput
  ShowEmptyHeader
}

pub type AccountBodyState {
  ShowAddThoughtInput
  ShowThoughtList
}
