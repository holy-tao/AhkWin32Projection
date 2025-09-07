#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains credentials used to authorize a client session.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/ns-wdsclientapi-wds_cli_cred
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDS_CLI_CRED extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The user name associated with the credentials.
     * @type {PWSTR}
     */
    pwszUserName{
        get {
            if(!this.HasProp("__pwszUserName"))
                this.__pwszUserName := PWSTR(this.ptr + 0)
            return this.__pwszUserName
        }
    }

    /**
     * The domain for the user name associated with the credentials.
     * @type {PWSTR}
     */
    pwszDomain{
        get {
            if(!this.HasProp("__pwszDomain"))
                this.__pwszDomain := PWSTR(this.ptr + 8)
            return this.__pwszDomain
        }
    }

    /**
     * The password for the user name associated with the credentials.
     * @type {PWSTR}
     */
    pwszPassword{
        get {
            if(!this.HasProp("__pwszPassword"))
                this.__pwszPassword := PWSTR(this.ptr + 16)
            return this.__pwszPassword
        }
    }
}
