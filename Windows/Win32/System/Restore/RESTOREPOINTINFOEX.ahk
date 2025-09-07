#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.System.Restore
 * @version v4.0.30319
 */
class RESTOREPOINTINFOEX extends Win32Struct
{
    static sizeof => 532

    static packingSize => 1

    /**
     * @type {FILETIME}
     */
    ftCreation{
        get {
            if(!this.HasProp("__ftCreation"))
                this.__ftCreation := FILETIME(this.ptr + 0)
            return this.__ftCreation
        }
    }

    /**
     * @type {Integer}
     */
    dwEventType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwRestorePtType {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dwRPNum {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 20, 255, "UTF-16")
        set => StrPut(value, this.ptr + 20, 255, "UTF-16")
    }
}
