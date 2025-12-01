#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SECURITY_STRING.ahk

/**
 * The SecurityUserData structure contains information about the user of a security support provider/authentication package. This structure is used by the SpGetUserInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-security_user_data
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECURITY_USER_DATA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The name of the user.
     * @type {SECURITY_STRING}
     */
    UserName{
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := SECURITY_STRING(0, this)
            return this.__UserName
        }
    }

    /**
     * The domain the user is logged onto.
     * @type {SECURITY_STRING}
     */
    LogonDomainName{
        get {
            if(!this.HasProp("__LogonDomainName"))
                this.__LogonDomainName := SECURITY_STRING(16, this)
            return this.__LogonDomainName
        }
    }

    /**
     * The name of the server that logged the user on.
     * @type {SECURITY_STRING}
     */
    LogonServer{
        get {
            if(!this.HasProp("__LogonServer"))
                this.__LogonServer := SECURITY_STRING(32, this)
            return this.__LogonServer
        }
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of the user.
     * @type {PSID}
     */
    pSid {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
