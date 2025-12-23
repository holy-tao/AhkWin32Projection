#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MOUSEINPUT.ahk
#Include .\KEYBDINPUT.ahk
#Include .\HARDWAREINPUT.ahk

/**
 * Used by SendInput to store information for synthesizing input events such as keystrokes, mouse movement, and mouse clicks.
 * @remarks
 * <b> INPUT_KEYBOARD</b> supports nonkeyboard input methods, such as handwriting recognition or voice recognition, as if it were text input by using the <b>KEYEVENTF_UNICODE</b> flag. For more information, see the remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-keybdinput">KEYBDINPUT</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-input
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 * @version v4.0.30319
 */
class INPUT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {MOUSEINPUT}
     */
    mi{
        get {
            if(!this.HasProp("__mi"))
                this.__mi := MOUSEINPUT(8, this)
            return this.__mi
        }
    }

    /**
     * @type {KEYBDINPUT}
     */
    ki{
        get {
            if(!this.HasProp("__ki"))
                this.__ki := KEYBDINPUT(8, this)
            return this.__ki
        }
    }

    /**
     * @type {HARDWAREINPUT}
     */
    hi{
        get {
            if(!this.HasProp("__hi"))
                this.__hi := HARDWAREINPUT(8, this)
            return this.__hi
        }
    }
}
