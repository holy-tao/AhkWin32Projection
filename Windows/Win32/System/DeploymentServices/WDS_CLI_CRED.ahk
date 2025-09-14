#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
     * @type {Pointer<PWSTR>}
     */
    pwszUserName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The domain for the user name associated with the credentials.
     * @type {Pointer<PWSTR>}
     */
    pwszDomain {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The password for the user name associated with the credentials.
     * @type {Pointer<PWSTR>}
     */
    pwszPassword {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
