#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class HTTP_FILTER_AUTHENT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    pszUser{
        get {
            if(!this.HasProp("__pszUser"))
                this.__pszUser := PSTR(this.ptr + 0)
            return this.__pszUser
        }
    }

    /**
     * @type {Integer}
     */
    cbUserBuff {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {PSTR}
     */
    pszPassword{
        get {
            if(!this.HasProp("__pszPassword"))
                this.__pszPassword := PSTR(this.ptr + 16)
            return this.__pszPassword
        }
    }

    /**
     * @type {Integer}
     */
    cbPasswordBuff {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
