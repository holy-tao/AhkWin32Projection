#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }

/**
 * Contains data associated with a CERT_KEY_CONTEXT_PROP_ID property.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_key_context
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_KEY_CONTEXT {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    hCryptProv : IntPtr

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
     */
    dwKeySpec : UInt32

    static __New() {
        DefineProp(this.Prototype, 'hNCryptKey', { type: NCRYPT_KEY_HANDLE, offset: 8 })
        this.DeleteProp("__New")
    }
}
