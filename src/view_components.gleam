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
  click_type: message_types.UserClickThoughtHeaderType,
  icon: fn() -> element.Element(message_types.Msg),
) {
  div(
    [
      class("flex gap-4 items-center hover:cursor-pointer"),
      event.on_click(message_types.UserClickThoughtHeader(click_type)),
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

pub fn header(model: model_types.Model) {
  div([class("h-64 py-8 px-4 w-full")], [header_up(), header_bottom(model)])
}

pub fn header_up() {
  div([class("flex justify-between")], [
    thoughts_panel(),
    thoughts_main_header_buttons(),
  ])
}

pub fn header_bottom(model: model_types.Model) {
  let choose_header_bottom = fn(header: model_types.AccountHeaderState) {
    case header {
      model_types.ShowEmptyHeader -> div([], [])
      model_types.ShowThoughtSearchAttachmentDetails -> attachment_details()
      model_types.ShowThoughtSearchInput -> search_base("Ищите")
    }
  }
  let header_bottom_element = case model {
    model_types.AccountPageState(header, _) -> choose_header_bottom(header)
  }
  div([class("flex my-8")], [header_bottom_element])
}

pub fn body(model: model_types.Model) {
  let choose_body = fn(body_state) {
    case body_state {
      model_types.ShowAddThoughtInput -> add_thought_input()
      model_types.ShowThoughtList -> div([], [])
      model_types.ShowEmptyBody -> div([], [])
      model_types.ShowThoughtFiles -> div([], [])
      model_types.ShowThoughtGifs -> div([], [])
      model_types.ShowThoughtMedia -> div([], [])
      model_types.ShowThoughtStickers -> div([], [])
    }
  }

  let body_element = case model {
    model_types.AccountPageState(_, body_state) -> {
      choose_body(body_state)
    }
  }
  div([class("")], [body_element])
}

///вью-компонент для инпута куда пользователь добавляет новую мысль
pub fn add_thought_input() {
  div([class("flex gap-8 bg-secondary p-8 rounded-lg")], [
    icons.attachment_small(),
    input([class("input-large w-158"), placeholder("Ваша мысль")]),
    icons.sticker_small(),
    icons.smile_small(),
    icons.gif_small(),
    icons.enter_icon_small(),
  ])
}

pub fn attachment_details() {
  div([class("flex gap-8")], [
    sticker_button(),
    gif_button(),
    file_button(),
    media_button(),
  ])
}

pub fn search_base(placeholder_value: String) {
  div([class("flex h-fit w-fit items-center gap-4")], [
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

pub fn sticker_button() {
  button_text_base(
    "Стикеры",
    message_types.ShowThoughtStickers,
    icons.sticker_small,
  )
}

pub fn gif_button() {
  button_text_base("Гифки", message_types.ShowThoughtGifs, icons.gif_small)
}

pub fn file_button() {
  button_text_base(
    "Файлы",
    message_types.ShowThoughtFiles,
    icons.file_small,
  )
}

pub fn media_button() {
  button_text_base(
    "Фото/Видео",
    message_types.ShowThoughtMedia,
    icons.media_small,
  )
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
