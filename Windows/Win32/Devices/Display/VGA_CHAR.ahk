#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\CHAR.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class VGA_CHAR extends Win32Struct
{
    static sizeof => 2

    static packingSize => 1

    /**
     * @type {CHAR}
     */
    Char{
        get {
            if(!this.HasProp("__Char"))
                this.__Char := CHAR(this.ptr + 0)
            return this.__Char
        }
    }

    /**
     * @type {CHAR}
     */
    Attributes{
        get {
            if(!this.HasProp("__Attributes"))
                this.__Attributes := CHAR(this.ptr + 1)
            return this.__Attributes
        }
    }
}
