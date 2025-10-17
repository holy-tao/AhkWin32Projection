#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

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
                this.__hImpersonationToken := HANDLE(0, this)
            return this.__hImpersonationToken
        }
    }

    /**
     * @type {PWSTR}
     */
    pszCustomUserName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PSTR}
     */
    pszCustomAuthType {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
