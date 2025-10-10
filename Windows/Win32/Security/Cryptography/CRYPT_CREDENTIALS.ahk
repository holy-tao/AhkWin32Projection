#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about credentials that can be passed as optional input to a remote object retrieval function such as CryptRetrieveObjectByUrl or CryptGetTimeValidObject.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_credentials
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_CREDENTIALS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size in bytes of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Pointer<Byte>}
     */
    pszCredentialsOid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a structure as defined by the <b>pszCredentialsOid</b> member.
     * @type {Pointer<Void>}
     */
    pvCredentials {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 24
    }
}
