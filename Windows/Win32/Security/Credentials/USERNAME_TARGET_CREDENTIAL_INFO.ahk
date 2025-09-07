#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The USERNAME_TARGET_CREDENTIAL_INFO structure contains a reference to a credential.
 * @see https://learn.microsoft.com/windows/win32/api/wincred/ns-wincred-username_target_credential_info
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class USERNAME_TARGET_CREDENTIAL_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * User name of the USERNAME_TARGET_CREDENTIAL_INFO credential.
     * @type {PWSTR}
     */
    UserName{
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := PWSTR(this.ptr + 0)
            return this.__UserName
        }
    }
}
