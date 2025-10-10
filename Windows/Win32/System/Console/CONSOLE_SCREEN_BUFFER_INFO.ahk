#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COORD.ahk
#Include .\SMALL_RECT.ahk

/**
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CONSOLE_SCREEN_BUFFER_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {COORD}
     */
    dwSize{
        get {
            if(!this.HasProp("__dwSize"))
                this.__dwSize := COORD(this.ptr + 0)
            return this.__dwSize
        }
    }

    /**
     * @type {COORD}
     */
    dwCursorPosition{
        get {
            if(!this.HasProp("__dwCursorPosition"))
                this.__dwCursorPosition := COORD(this.ptr + 4)
            return this.__dwCursorPosition
        }
    }

    /**
     * @type {Integer}
     */
    wAttributes {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {SMALL_RECT}
     */
    srWindow{
        get {
            if(!this.HasProp("__srWindow"))
                this.__srWindow := SMALL_RECT(this.ptr + 16)
            return this.__srWindow
        }
    }

    /**
     * @type {COORD}
     */
    dwMaximumWindowSize{
        get {
            if(!this.HasProp("__dwMaximumWindowSize"))
                this.__dwMaximumWindowSize := COORD(this.ptr + 24)
            return this.__dwMaximumWindowSize
        }
    }
}
