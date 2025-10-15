#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COORD.ahk
#Include .\SMALL_RECT.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\COLORREF.ahk

/**
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CONSOLE_SCREEN_BUFFER_INFOEX extends Win32Struct
{
    static sizeof => 168

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {COORD}
     */
    dwSize{
        get {
            if(!this.HasProp("__dwSize"))
                this.__dwSize := COORD(this.ptr + 4)
            return this.__dwSize
        }
    }

    /**
     * @type {COORD}
     */
    dwCursorPosition{
        get {
            if(!this.HasProp("__dwCursorPosition"))
                this.__dwCursorPosition := COORD(this.ptr + 8)
            return this.__dwCursorPosition
        }
    }

    /**
     * @type {Integer}
     */
    wAttributes {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
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

    /**
     * @type {Integer}
     */
    wPopupAttributes {
        get => NumGet(this, 28, "ushort")
        set => NumPut("ushort", value, this, 28)
    }

    /**
     * @type {BOOL}
     */
    bFullscreenSupported{
        get {
            if(!this.HasProp("__bFullscreenSupported"))
                this.__bFullscreenSupported := BOOL(this.ptr + 32)
            return this.__bFullscreenSupported
        }
    }

    /**
     * @type {Array<COLORREF>}
     */
    ColorTable{
        get {
            if(!this.HasProp("__ColorTableProxyArray"))
                this.__ColorTableProxyArray := Win32FixedArray(this.ptr + 40, 16, COLORREF, "")
            return this.__ColorTableProxyArray
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 168
    }
}
