import lustre/attribute.{class, src}
import lustre/element/html.{div, img}

fn small(icon_name: String) {
  icon_template(icon_name, "min-w-8 min-h-8 max-w-8 max-h-8")
}

// fn medium(icon_name: String) {
//   icon_template(icon_name, "size-16")
// }

// fn large(icon_name: String) {
//   icon_template(icon_name, "size-20")
// }

pub fn add_small() {
  small("add_small.svg")
}

pub fn account_small() {
  small("accaount_small.svg")
}

pub fn groups_small() {
  icon_template("groups_small.svg", "min-w-16 max-w-16 min-h-8 max-h-8")
}

pub fn message_small() {
  small("message_small.svg")
}

pub fn search_icon() {
  small("search_small.svg")
}

pub fn list_small() {
  small("list_small.svg")
}

pub fn attachment_small() {
  small("attachment_small.svg")
}

pub fn sticker_small() {
  small("sticker_small.svg")
}

pub fn smile_small() {
  small("smile_small.svg")
}

pub fn giff_small() {
  small("giff_small.svg")
}

pub fn enter_icon_small() {
  small("enter_small.svg")
}

pub fn icon_template(icon_name: String, class_name_size: String) {
  div([class(class_name_size)], [
    img([class(class_name_size), src("/priv/static/icons/" <> icon_name)]),
  ])
}
