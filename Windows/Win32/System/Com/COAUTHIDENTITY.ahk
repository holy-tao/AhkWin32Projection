#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a user name and password.
 * @remarks
 * 
  * COM does not persist the user's password information. For applications that use passwords, please see the documentation on <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-portal">Cryptography</a> (CryptoAPI). 
  * 
  * 
  * This structure is equivalenet to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wtypesbase/ns-wtypesbase-coauthidentity
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class COAUTHIDENTITY extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The user's name.
     * @type {Pointer<UInt16>}
     */
    User {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The length of the <b>User</b> string, without the terminating <b>NULL</b>.
     * @type {Integer}
     */
    UserLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The domain or workgroup name.
     * @type {Pointer<UInt16>}
     */
    Domain {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The length of the <b>Domain</b> string, without the terminating <b>NULL</b>.
     * @type {Integer}
     */
    DomainLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The user's password in the domain or workgroup.
     * @type {Pointer<UInt16>}
     */
    Password {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The length of the <b>Password</b> string, without the terminating <b>NULL</b>.
     * @type {Integer}
     */
    PasswordLength {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Indicates whether the strings are Unicode strings.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_WINNT_AUTH_IDENTITY_ANSI"></a><a id="sec_winnt_auth_identity_ansi"></a><dl>
     * <dt><b>SEC_WINNT_AUTH_IDENTITY_ANSI</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The strings are ANSI strings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_WINNT_AUTH_IDENTITY_UNICODE"></a><a id="sec_winnt_auth_identity_unicode"></a><dl>
     * <dt><b>SEC_WINNT_AUTH_IDENTITY_UNICODE</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The strings are Unicode strings.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
