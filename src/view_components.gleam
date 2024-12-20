import icons
import lustre/attribute.{class, placeholder}
import lustre/element
import lustre/element/html.{div, input, span}
import lustre/event
import message_types
import model_types

///базовый вью компонент для кнопок в верхней панели с действиями на личной странице
fn button_text_base(
  text: String,
  click_type: message_types.UserClickThoughtPanelType,
  icon: fn() -> element.Element(message_types.Msg),
) {
  div(
    [
      class("flex gap-4 items-center hover:cursor-pointer"),
      event.on_click(message_types.UserClickThoughtPanel(click_type)),
    ],
    [icon(), span([class("font-ui-primary")], [element.text(text)])],
  )
}

///Верхняя панель с действиями на личной странице
pub fn thoughts_panel() {
  div([class("flex justify-space-between w-fit h-fit gap-8")], [
    thoughts_list_button(),
    add_thought_button(),
    search_by_attacment_button(),
    search_thougts_button(),
  ])
}

///вью-компонент для правых верхних кнопок для навигации по приложению
pub fn thoughts_main_header_buttons() {
  div([class("flex gap-12 justify-end h-fit w-fit")], [
    icons.message_small(),
    icons.groups_small(),
    icons.account_small(),
  ])
}

pub fn search_thoughts() {
  search_base("Ищите ваши мысли...")
}

pub fn account_header() {
  div([class("flex h-64 py-8 px-4 justify-between w-full")], [
    thoughts_panel(),
    thoughts_main_header_buttons(),
  ])
}

pub fn account_body(msg: model_types.Model) {
  let choose_body = fn(body_state) {
    case body_state {
      model_types.ShowAddThoughtInput -> add_thought_input()
      model_types.ShowThoughtList -> div([], [])
    }
  }

  let body_element = case msg {
    model_types.AccountPageState(_, body_state) -> {
      choose_body(body_state)
    }
  }
  div([class("")], [body_element])
}

///вью-компонент
pub fn add_thought_input() {
  div([class("flex gap-8 bg-secondary p-8 rounded-lg")], [
    icons.attachment_small(),
    input([class("input-large w-158"), placeholder("Ваша мысль")]),
    icons.sticker_small(),
    icons.smile_small(),
    icons.giff_small(),
    icons.enter_icon_small(),
  ])
}

pub fn search_base(placeholder_value: String) {
  div([class("flex items-center gap-4")], [
    text_input_base(placeholder_value, icons.search_icon),
    icons.enter_icon_small(),
  ])
}

pub fn text_input_base(
  placeholder_value: String,
  icon: fn() -> element.Element(a),
) {
  div([class("flex gap-4 border-b-2 px-4 py-2")], [
    icon(),
    input([placeholder(placeholder_value), class("input-base w-48")]),
  ])
}

///вью-компонент для кнопки списка мыслей пользователя
pub fn thoughts_list_button() {
  button_text_base(
    "Все мысли",
    message_types.ThoughtList,
    icons.list_small,
  )
}

///вью-компонент для кнопки добавления новой мысли
pub fn add_thought_button() {
  button_text_base("Мысля", message_types.AddThought, icons.add_small)
}

///вью-компонент для кнопки поиска мыслей по содержанию
pub fn search_thougts_button() {
  button_text_base(
    "Блуждание по разуму",
    message_types.SearchByThoughtContent,
    icons.search_icon,
  )
}

///вью-компонент для кнопки для появления других кнопок. 
///Появившиеся кнопки позволяют выбрать тип вложения, 
///по которому будет происходить фильтрация
pub fn search_by_attacment_button() {
  button_text_base(
    "Вложения",
    message_types.SearchByAttachment,
    icons.attachment_small,
  )
}
