import gleam/io
import lustre
import lustre/attribute.{class}
import lustre/effect
import lustre/element
import lustre/element/html.{div}
import message_types
import model_types
import view_components

pub fn main() {
  io.debug("Hi mum")
  lustre.application(init, update, view)
  |> lustre.start("#app", Nil)
}

fn init(_flags) {
  let model =
    model_types.AccountPageState(
      model_types.ShowEmptyHeader,
      model_types.ShowThoughtList,
    )
  #(model, effect.none())
}

pub fn update(model: model_types.Model, msg: message_types.Msg) {
  let handle_thought_user_click = fn(
    msg_type: message_types.UserClickThoughtPanelType,
  ) {
    io.debug("ewq")
    case msg_type, model {
      //Пользователь нажал на добавить мысль
      message_types.AddThought, model_types.AccountPageState(header_state, _) ->
        model_types.AccountPageState(
          header_state,
          model_types.ShowAddThoughtInput,
        )

      //Пользователь нажал на поиск мыслей по вложениям
      message_types.SearchByAttachment,
        model_types.AccountPageState(_, body_state)
      ->
        model_types.AccountPageState(
          model_types.ShowThoughtSearchAttachmentDetails,
          body_state,
        )
      //Пользователь нажал на поиск мыслей по содержимому
      message_types.SearchByThoughtContent,
        model_types.AccountPageState(_, body_state)
      ->
        model_types.AccountPageState(
          model_types.ShowThoughtSearchInput,
          body_state,
        )
      //Пользователь нажал на показать список мыслей
      message_types.ThoughtList, model_types.AccountPageState(header_state, _) ->
        model_types.AccountPageState(header_state, model_types.ShowThoughtList)
    }
  }

  let model = case msg {
    message_types.UserClickThoughtPanel(msg_type) ->
      handle_thought_user_click(msg_type)
  }
  #(model, effect.none())
}

pub fn view(model: model_types.Model) -> element.Element(message_types.Msg) {
  div([class("w-full flex justify-center bg-primary")], [
    div([class("w-256 min-h-screen")], [
      view_components.account_header(),
      view_components.account_body(model),
    ]),
  ])
}
