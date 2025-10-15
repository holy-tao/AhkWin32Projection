#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 * @charset ANSI
 */
class MCI_OVLY_SAVE_PARMSA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

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
    lpfilename{
        get {
            if(!this.HasProp("__lpfilename"))
                this.__lpfilename := PSTR(this.ptr + 8)
            return this.__lpfilename
        }
    }

    /**
     * @type {RECT}
     */
    rc{
        get {
            if(!this.HasProp("__rc"))
                this.__rc := RECT(this.ptr + 16)
            return this.__rc
        }
    }
}
