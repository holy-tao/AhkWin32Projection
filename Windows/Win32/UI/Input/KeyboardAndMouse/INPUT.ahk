#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KEYBD_EVENT_FLAGS.ahk" { KEYBD_EVENT_FLAGS }
#Import ".\HARDWAREINPUT.ahk" { HARDWAREINPUT }
#Import ".\KEYBDINPUT.ahk" { KEYBDINPUT }
#Import ".\INPUT_TYPE.ahk" { INPUT_TYPE }
#Import ".\MOUSEINPUT.ahk" { MOUSEINPUT }
#Import ".\VIRTUAL_KEY.ahk" { VIRTUAL_KEY }
#Import ".\MOUSE_EVENT_FLAGS.ahk" { MOUSE_EVENT_FLAGS }

/**
 * Used by SendInput to store information for synthesizing input events such as keystrokes, mouse movement, and mouse clicks.
 * @remarks
 * <b> INPUT_KEYBOARD</b> supports nonkeyboard input methods, such as handwriting recognition or voice recognition, as if it were text input by using the <b>KEYEVENTF_UNICODE</b> flag. For more information, see the remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-keybdinput">KEYBDINPUT</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-input
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct INPUT {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     */
    type : INPUT_TYPE

    mi : MOUSEINPUT

    static __New() {
        DefineProp(this.Prototype, 'ki', { type: KEYBDINPUT, offset: 8 })
        DefineProp(this.Prototype, 'hi', { type: HARDWAREINPUT, offset: 8 })
        this.DeleteProp("__New")
    }
}
