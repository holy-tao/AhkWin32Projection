#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class APPLYCANDEXPARAM extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    lpwstrDisplay{
        get {
            if(!this.HasProp("__lpwstrDisplay"))
                this.__lpwstrDisplay := PWSTR(this.ptr + 8)
            return this.__lpwstrDisplay
        }
    }

    /**
     * @type {PWSTR}
     */
    lpwstrReading{
        get {
            if(!this.HasProp("__lpwstrReading"))
                this.__lpwstrReading := PWSTR(this.ptr + 16)
            return this.__lpwstrReading
        }
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
