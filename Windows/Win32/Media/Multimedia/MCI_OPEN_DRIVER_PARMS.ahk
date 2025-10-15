#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MCI_OPEN_DRIVER_PARMS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    wDeviceID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    lpstrParams{
        get {
            if(!this.HasProp("__lpstrParams"))
                this.__lpstrParams := PWSTR(this.ptr + 8)
            return this.__lpstrParams
        }
    }

    /**
     * @type {Integer}
     */
    wCustomCommandTable {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    wType {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
