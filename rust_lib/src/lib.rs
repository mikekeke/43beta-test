use godot::prelude::*;


#[derive(GodotClass)]
#[class(base=RefCounted, rename=_TextExt)]
pub struct TextExt {}

#[godot_api]
impl TextExt {
    pub fn get_n() -> u64 {
        42
    }

    #[func]
    fn _get_n() -> u64 {
        Self::get_n()
    }
}

struct MyExtension;

#[gdextension]
unsafe impl ExtensionLibrary for MyExtension {}