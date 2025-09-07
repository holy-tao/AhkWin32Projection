#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class WLX_SC_NOTIFICATION_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pszCard{
        get {
            if(!this.HasProp("__pszCard"))
                this.__pszCard := PWSTR(this.ptr + 0)
            return this.__pszCard
        }
    }

    /**
     * @type {PWSTR}
     */
    pszReader{
        get {
            if(!this.HasProp("__pszReader"))
                this.__pszReader := PWSTR(this.ptr + 8)
            return this.__pszReader
        }
    }

    /**
     * @type {PWSTR}
     */
    pszContainer{
        get {
            if(!this.HasProp("__pszContainer"))
                this.__pszContainer := PWSTR(this.ptr + 16)
            return this.__pszContainer
        }
    }

    /**
     * @type {PWSTR}
     */
    pszCryptoProvider{
        get {
            if(!this.HasProp("__pszCryptoProvider"))
                this.__pszCryptoProvider := PWSTR(this.ptr + 24)
            return this.__pszCryptoProvider
        }
    }
}
