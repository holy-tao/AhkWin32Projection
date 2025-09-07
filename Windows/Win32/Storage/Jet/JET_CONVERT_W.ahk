#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 * @charset Unicode
 */
class JET_CONVERT_W extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    szOldDll{
        get {
            if(!this.HasProp("__szOldDll"))
                this.__szOldDll := PWSTR(this.ptr + 0)
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
