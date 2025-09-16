#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * Identifies the algorithm used to generate an RSA PKCS
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_mask_gen_algorithm
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_MASK_GEN_ALGORITHM extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The address of a null-terminated ANSI string that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) of the mask generation algorithm. This can be the following value or any other mask generation function OID.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_RSA_MGF1"></a><a id="szoid_rsa_mgf1"></a><a id="SZOID_RSA_MGF1"></a><dl>
     * <dt><b>szOID_RSA_MGF1</b></dt>
     * <dt>"1.2.840.113549.1.1.8"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The RSA MGF1 function.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Pointer<PSTR>}
     */
    pszObjId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that identifies the hash algorithm to use for the mask generation.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    HashAlgorithm{
        get {
            if(!this.HasProp("__HashAlgorithm"))
                this.__HashAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 8)
            return this.__HashAlgorithm
        }
    }
}
