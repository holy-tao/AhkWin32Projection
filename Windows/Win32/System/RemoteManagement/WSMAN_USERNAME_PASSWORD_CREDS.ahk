#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the credentials used for authentication.
 * @remarks
 * 
  * The client can specify the credentials to use when creating a shell on a computer. The user name should be specified in the form DOMAIN\username for a domain account or SERVERNAME\username for a local account on a server computer.
  * 
  * If this structure is used, it should have both the user name and password fields specified. It can be used with Basic, Digest, Negotiate, or Kerberos authentication. The client must explicitly specify the credentials when either Basic or Digest authentication is used.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsman/ns-wsman-wsman_username_password_creds
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_USERNAME_PASSWORD_CREDS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Defines the user name for a local or domain account. It cannot be <b>NULL</b>.
     * @type {PWSTR}
     */
    username {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Defines the password for a local or domain account. It cannot be <b>NULL</b>.
     * @type {PWSTR}
     */
    password {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
