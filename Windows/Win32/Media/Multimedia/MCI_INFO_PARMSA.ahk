#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 * @charset ANSI
 */
class MCI_INFO_PARMSA extends Win32Struct
{
    static sizeof => 20

    static packingSize => 1

    /**
     * @type {Pointer}
     */
    dwCallback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PSTR}
     */
    lpstrReturn{
        get {
            if(!this.HasProp("__lpstrReturn"))
                this.__lpstrReturn := PSTR(this.ptr + 8)
            return this.__lpstrReturn
        }
    }

    /**
     * @type {Integer}
     */
    dwRetSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
