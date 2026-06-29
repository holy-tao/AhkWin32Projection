#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a user name and password.
 * @remarks
 * COM does not persist the user's password information. For applications that use passwords, please see the documentation on <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-portal">Cryptography</a> (CryptoAPI). 
 * 
 * 
 * This structure is equivalent to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/wtypesbase/ns-wtypesbase-coauthidentity
 * @namespace Windows.Win32.System.Com
 */
export default struct COAUTHIDENTITY {
    #StructPack 8

    /**
     * The user's name.
     */
    User : IntPtr

    /**
     * The length of the <b>User</b> string, without the terminating <b>NULL</b>.
     */
    UserLength : UInt32

    /**
     * The domain or workgroup name.
     */
    Domain : IntPtr

    /**
     * The length of the <b>Domain</b> string, without the terminating <b>NULL</b>.
     */
    DomainLength : UInt32

    /**
     * The user's password in the domain or workgroup.
     */
    Password : IntPtr

    /**
     * The length of the <b>Password</b> string, without the terminating <b>NULL</b>.
     */
    PasswordLength : UInt32

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
     */
    Flags : UInt32

}
