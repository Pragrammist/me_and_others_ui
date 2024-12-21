import lustre
import lustre/attribute.{class}
import lustre/effect
import lustre/element
import lustre/element/html.{div}
import message_types
import model_types
import updates
import view_components

pub fn main() {
  lustre.application(init, update, view)
  |> lustre.start("#app", Nil)
}

fn init(_flags) {
  let model =
    model_types.AccountPageState(
      model_types.ShowEmptyHeader,
      model_types.ShowAddThoughtInput,
    )
  #(model, effect.none())
}

pub fn update(model: model_types.Model, msg: message_types.Msg) {
  let model = case msg {
    message_types.UserClickThoughtHeader(msg_type) ->
      updates.handle_thought_header_user_click(msg_type, model)
  }
  #(model, effect.none())
}

pub fn view(model: model_types.Model) -> element.Element(message_types.Msg) {
  div([class("w-full flex justify-center bg-primary")], [
    div([class("w-256 min-h-screen")], [
      view_components.header(model),
      view_components.body(model),
    ]),
  ])
}
