#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 * @charset ANSI
 */
class JET_CONVERT_A extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    szOldDll{
        get {
            if(!this.HasProp("__szOldDll"))
                this.__szOldDll := PSTR(this.ptr + 0)
            return this.__szOldDll
        }
    }

    /**
     * @type {Integer}
     */
    fFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
