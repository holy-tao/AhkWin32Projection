#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SEC_WINNT_AUTH_IDENTITY structure enables passing a particular user name and password to the run-time library for the purpose of authentication. The structure is valid for Windows and Macintosh.
 * @remarks
 * 
  * This structure must remain valid for the lifetime of the binding handle unless pointed to from the <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_http_transport_credentials_a">RPC_HTTP_TRANSPORT_CREDENTIALS</a> or <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_http_transport_credentials_v2_a">RPC_HTTP_TRANSPORT_CREDENTIALS_V2</a> structure.
  * 
  * The strings may be ANSI or UNICODE depending on the value assigned to <b>Flags</b>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//rpcdce/ns-rpcdce-sec_winnt_auth_identity_a
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 * @charset ANSI
 */
class SEC_WINNT_AUTH_IDENTITY_A extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * String containing the user name.
     * @type {Pointer<Byte>}
     */
    User {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Number of characters in <b>User</b>, excluding the terminating <b>NULL</b>.
     * @type {Integer}
     */
    UserLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * String containing the domain  or workgroup name.
     * @type {Pointer<Byte>}
     */
    Domain {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Number of characters in <b>Domain</b>, excluding the terminating <b>NULL</b>.
     * @type {Integer}
     */
    DomainLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * String containing the user's password in the domain or workgroup.
     * @type {Pointer<Byte>}
     */
    Password {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Number of characters in <b>Password</b>, excluding the terminating <b>NULL</b>.
     * @type {Integer}
     */
    PasswordLength {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Flags used to specify ANSI or UNICODE. Must be one of the following:
     * 
     * <a id="SEC_WINNT_AUTH_IDENTITY_ANSI"></a>
     * <a id="sec_winnt_auth_identity_ansi"></a>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
