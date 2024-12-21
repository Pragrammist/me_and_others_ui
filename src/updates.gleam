import message_types
import model_types

///обработчик нажатий всех кнопок в шапке
pub fn handle_thought_header_user_click(
  msg_type: message_types.UserClickThoughtHeaderType,
  model: model_types.Model,
) {
  let user_click_the_same_button_handler_body = fn(
    current_state: model_types.AccountBodyState,
    new_state: model_types.AccountBodyState,
  ) {
    case current_state == new_state {
      False -> new_state
      True -> model_types.ShowEmptyBody
    }
  }

  let user_click_the_same_button_handler_header = fn(
    current_state: model_types.AccountHeaderState,
    new_state: model_types.AccountHeaderState,
  ) {
    case current_state == new_state {
      False -> new_state
      True -> model_types.ShowEmptyHeader
    }
  }

  case msg_type, model {
    //Пользователь нажал на добавить мысль
    message_types.AddThought,
      model_types.AccountPageState(header_state, body_state)
    ->
      model_types.AccountPageState(
        header_state,
        user_click_the_same_button_handler_body(
          body_state,
          model_types.ShowAddThoughtInput,
        ),
      )

    //Пользователь нажал на поиск мыслей по вложениям
    message_types.SearchByAttachment,
      model_types.AccountPageState(header_state, body_state)
    ->
      model_types.AccountPageState(
        user_click_the_same_button_handler_header(
          header_state,
          model_types.ShowThoughtSearchAttachmentDetails,
        ),
        body_state,
      )
    //Пользователь нажал на поиск мыслей по содержимому
    message_types.SearchByThoughtContent,
      model_types.AccountPageState(header_state, body_state)
    ->
      model_types.AccountPageState(
        user_click_the_same_button_handler_header(
          header_state,
          model_types.ShowThoughtSearchInput,
        ),
        body_state,
      )
    //Пользователь нажал на показать список мыслей
    message_types.ThoughtList,
      model_types.AccountPageState(header_state, body_state)
    ->
      model_types.AccountPageState(
        header_state,
        user_click_the_same_button_handler_body(
          body_state,
          model_types.ShowThoughtList,
        ),
      )
    message_types.ShowThoughtFiles,
      model_types.AccountPageState(header_state, body_state)
    ->
      model_types.AccountPageState(
        header_state,
        user_click_the_same_button_handler_body(
          body_state,
          model_types.ShowThoughtFiles,
        ),
      )
    message_types.ShowThoughtGifs,
      model_types.AccountPageState(header_state, body_state)
    ->
      model_types.AccountPageState(
        header_state,
        user_click_the_same_button_handler_body(
          body_state,
          model_types.ShowThoughtGifs,
        ),
      )
    message_types.ShowThoughtMedia,
      model_types.AccountPageState(header_state, body_state)
    ->
      model_types.AccountPageState(
        header_state,
        user_click_the_same_button_handler_body(
          body_state,
          model_types.ShowThoughtMedia,
        ),
      )
    message_types.ShowThoughtStickers,
      model_types.AccountPageState(header_state, body_state)
    ->
      model_types.AccountPageState(
        header_state,
        user_click_the_same_button_handler_body(
          body_state,
          model_types.ShowThoughtStickers,
        ),
      )
  }
}
