#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NCRYPT_KEY_HANDLE.ahk

/**
 * Contains data associated with a CERT_KEY_CONTEXT_PROP_ID property.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_key_context
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_KEY_CONTEXT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    hCryptProv {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {NCRYPT_KEY_HANDLE}
     */
    hNCryptKey{
        get {
            if(!this.HasProp("__hNCryptKey"))
                this.__hNCryptKey := NCRYPT_KEY_HANDLE(this.ptr + 8)
            return this.__hNCryptKey
        }
    }

    /**
     * The specification of the private key to retrieve. 
     * 
     * 
     * 
     * 
     * The following <b>dwKeySpec</b> values are defined for the default provider.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AT_KEYEXCHANGE"></a><a id="at_keyexchange"></a><dl>
     * <dt><b>AT_KEYEXCHANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Keys used to encrypt/decrypt session keys.  The handle to the CSP is contained in the <b>hCryptProv</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AT_SIGNATURE"></a><a id="at_signature"></a><dl>
     * <dt><b>AT_SIGNATURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Keys used to create and verify digital signatures.  The handle to the CSP is contained in the <b>hCryptProv</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_NCRYPT_KEY_SPEC"></a><a id="cert_ncrypt_key_spec"></a><dl>
     * <dt><b>CERT_NCRYPT_KEY_SPEC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Keys associated with a CNG CSP.  The handle to the CNG CSP is set in the <b>hNCryptProv</b> member.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This value is not used.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwKeySpec {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
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
