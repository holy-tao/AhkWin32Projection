#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains credential information for a user.
 * @remarks
 * The user name and password are plaintext.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_user_credential
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_USER_CREDENTIAL extends Win32Struct
{
    static sizeof => 1536

    static packingSize => 2

    /**
     * A string that contains the name of the user.
     * @type {String}
     */
    UserName {
        get => StrGet(this.ptr + 0, 255, "UTF-16")
        set => StrPut(value, this.ptr + 0, 255, "UTF-16")
    }

    /**
     * A string that contains the user password.
     * @type {String}
     */
    Password {
        get => StrGet(this.ptr + 512, 255, "UTF-16")
        set => StrPut(value, this.ptr + 512, 255, "UTF-16")
    }

    /**
     * A string that contains the domain name for the user.
     * @type {String}
     */
    Domain {
        get => StrGet(this.ptr + 1024, 255, "UTF-16")
        set => StrPut(value, this.ptr + 1024, 255, "UTF-16")
    }
}
