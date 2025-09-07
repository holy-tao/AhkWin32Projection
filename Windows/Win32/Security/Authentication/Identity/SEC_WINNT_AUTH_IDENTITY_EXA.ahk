#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SEC_WINNT_AUTH_IDENTITY_EXA (ANSI) structure contains information about a user.
 * @remarks
 * Note that when this structure is used with RPC, the structure must remain valid for the lifetime of the binding handle.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_winnt_auth_identity_exa
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 * @charset ANSI
 */
class SEC_WINNT_AUTH_IDENTITY_EXA extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * An unsigned long that indicates the version number of the structure.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An unsigned long that indicates the length, in bytes, of the structure.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A Unicode or ANSI string that contains the name of the user account.
     * @type {Pointer<Byte>}
     */
    User {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The length, in characters, of the <b>User</b> string.
     * @type {Integer}
     */
    UserLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A Unicode or ANSI string that contains the name of the domain for the user account.
     * @type {Pointer<Byte>}
     */
    Domain {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The length, in characters, of the <b>Domain</b> string.
     * @type {Integer}
     */
    DomainLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A Unicode or ANSI string that contains the user password in plaintext. When you have finished using the password, remove the sensitive information from memory by calling the <a href="https://msdn.microsoft.com/2c4090a6-025b-4b7b-8f31-7e744ad51b39">SecureZeroMemory</a> function. For more information about protecting the password, see <a href="https://msdn.microsoft.com/1d810f71-9bf5-4c5c-a573-c35081f604cf">Handling Passwords</a>.
     * @type {Pointer<Byte>}
     */
    Password {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The length, in characters, of the <b>Password</b> string.
     * @type {Integer}
     */
    PasswordLength {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * An unsigned long flag that indicates the type used by negotiable <a href="https://msdn.microsoft.com/3e9d7672-2314-45c8-8178-5a0afcfd0c50">security packages</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_WINNT_AUTH_IDENTITY_MARSHALLED"></a><a id="sec_winnt_auth_identity_marshalled"></a><dl>
     * <dt><b>SEC_WINNT_AUTH_IDENTITY_MARSHALLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All data is in one buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_WINNT_AUTH_IDENTITY_ONLY"></a><a id="sec_winnt_auth_identity_only"></a><dl>
     * <dt><b>SEC_WINNT_AUTH_IDENTITY_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Used with the <a href="https://msdn.microsoft.com/f17042c3-ba1a-408f-af55-5f171b0dee33">Kerberos</a> <a href="https://msdn.microsoft.com/3e9d7672-2314-45c8-8178-5a0afcfd0c50">security support provider</a> (SSP). Credentials are for identity only. The Kerberos package is directed to not include authorization data in the ticket.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_WINNT_AUTH_IDENTITY_ANSI"></a><a id="sec_winnt_auth_identity_ansi"></a><dl>
     * <dt><b>SEC_WINNT_AUTH_IDENTITY_ANSI</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Credentials are in ANSI form.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_WINNT_AUTH_IDENTITY_UNICODE"></a><a id="sec_winnt_auth_identity_unicode"></a><dl>
     * <dt><b>SEC_WINNT_AUTH_IDENTITY_UNICODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Credentials are in Unicode form.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * A Unicode or ANSI string that contains a comma-separated list of names of security packages that are available when using the <a href="https://msdn.microsoft.com/3aa7e979-8b55-416d-bed1-28296055d38e">Microsoft Negotiate</a> provider.
     * 
     * Set this to "!ntlm" to specify that the <a href="https://msdn.microsoft.com/35a38858-d36f-45c9-95f4-2541a182f5ac">NTLM</a> package is not to be used.
     * @type {Pointer<Byte>}
     */
    PackageList {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The length, in characters, of the <b>PackageList</b> string.
     * @type {Integer}
     */
    PackageListLength {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
