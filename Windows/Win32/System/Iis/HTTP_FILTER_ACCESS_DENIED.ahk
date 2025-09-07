#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class HTTP_FILTER_ACCESS_DENIED extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    pszURL{
        get {
            if(!this.HasProp("__pszURL"))
                this.__pszURL := PSTR(this.ptr + 0)
            return this.__pszURL
        }
    }

    /**
     * @type {PSTR}
     */
    pszPhysicalPath{
        get {
            if(!this.HasProp("__pszPhysicalPath"))
                this.__pszPhysicalPath := PSTR(this.ptr + 8)
            return this.__pszPhysicalPath
        }
    }

    /**
     * @type {Integer}
     */
    dwReason {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
