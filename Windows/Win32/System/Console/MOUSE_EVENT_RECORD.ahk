#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COORD.ahk

/**
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class MOUSE_EVENT_RECORD extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {COORD}
     */
    dwMousePosition{
        get {
            if(!this.HasProp("__dwMousePosition"))
                this.__dwMousePosition := COORD(0, this)
            return this.__dwMousePosition
        }
    }

    /**
     * @type {Integer}
     */
    dwButtonState {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwControlKeyState {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwEventFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
