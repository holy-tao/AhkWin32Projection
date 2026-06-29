#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Defines the credentials used for authentication.
 * @remarks
 * The client can specify the credentials to use when creating a shell on a computer. The user name should be specified in the form DOMAIN\username for a domain account or SERVERNAME\username for a local account on a server computer.
 * 
 * If this structure is used, it should have both the user name and password fields specified. It can be used with Basic, Digest, Negotiate, or Kerberos authentication. The client must explicitly specify the credentials when either Basic or Digest authentication is used.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_username_password_creds
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_USERNAME_PASSWORD_CREDS {
    #StructPack 8

    /**
     * Defines the user name for a local or domain account. It cannot be <b>NULL</b>.
     */
    username : PWSTR

    /**
     * Defines the password for a local or domain account. It cannot be <b>NULL</b>.
     */
    password : PWSTR

}
