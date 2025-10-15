#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class WIAS_ENDORSER_VALUE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    wszTokenName{
        get {
            if(!this.HasProp("__wszTokenName"))
                this.__wszTokenName := PWSTR(this.ptr + 0)
            return this.__wszTokenName
        }
    }

    /**
     * @type {PWSTR}
     */
    wszValue{
        get {
            if(!this.HasProp("__wszValue"))
                this.__wszValue := PWSTR(this.ptr + 8)
            return this.__wszValue
        }
    }
}
