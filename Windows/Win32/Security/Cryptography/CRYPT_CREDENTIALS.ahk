#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about credentials that can be passed as optional input to a remote object retrieval function such as CryptRetrieveObjectByUrl or CryptGetTimeValidObject.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_credentials
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_CREDENTIALS {
    #StructPack 8

    /**
     * The size in bytes of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A pointer to a null-terminated string that contains the type of credential object represented by the <b>pvCredentials</b> member.
     * 
     * 
     * This member can contain the following possible value.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CREDENTIAL_OID_PASSWORD_CREDENTIALS"></a><a id="credential_oid_password_credentials"></a><dl>
     * <dt><b>CREDENTIAL_OID_PASSWORD_CREDENTIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>pvCredentials</b> member contains a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_password_credentialsa">CRYPT_PASSWORD_CREDENTIALS</a> structure that represents a user name and password combination.
     * 
     * </td>
     * </tr>
     * </table>
     */
    pszCredentialsOid : PSTR

    /**
     * A pointer to a structure as defined by the <b>pszCredentialsOid</b> member.
     */
    pvCredentials : IntPtr

}
