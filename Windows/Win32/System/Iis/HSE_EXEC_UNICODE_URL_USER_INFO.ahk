#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class HSE_EXEC_UNICODE_URL_USER_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    hImpersonationToken{
        get {
            if(!this.HasProp("__hImpersonationToken"))
                this.__hImpersonationToken := HANDLE(this.ptr + 0)
            return this.__hImpersonationToken
        }
    }

    /**
     * @type {PWSTR}
     */
    pszCustomUserName{
        get {
            if(!this.HasProp("__pszCustomUserName"))
                this.__pszCustomUserName := PWSTR(this.ptr + 8)
            return this.__pszCustomUserName
        }
    }

    /**
     * @type {PSTR}
     */
    pszCustomAuthType{
        get {
            if(!this.HasProp("__pszCustomAuthType"))
                this.__pszCustomAuthType := PSTR(this.ptr + 16)
            return this.__pszCustomAuthType
        }
    }
}
