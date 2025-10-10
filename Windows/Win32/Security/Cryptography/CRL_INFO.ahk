#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains the information of a certificate revocation list (CRL).
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crl_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRL_INFO extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Version number of the CRL. Currently defined version numbers are shown in the following table. 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRL_V1"></a><a id="crl_v1"></a><dl>
     * <dt><b>CRL_V1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * version 1
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRL_V2"></a><a id="crl_v2"></a><dl>
     * <dt><b>CRL_V2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * version 2
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) of a signature algorithm and any associated additional parameters.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    SignatureAlgorithm{
        get {
            if(!this.HasProp("__SignatureAlgorithm"))
                this.__SignatureAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 8)
            return this.__SignatureAlgorithm
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> structure that contains an encoded certificate issuer's name.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Issuer{
        get {
            if(!this.HasProp("__Issuer"))
                this.__Issuer := CRYPT_INTEGER_BLOB(this.ptr + 32)
            return this.__Issuer
        }
    }

    /**
     * Indication of the date and time of the CRL's published. If the time is after 1950 and before 2050, it is UTC-time encoded as an 8-byte date/time precise to seconds with a 2-digit year (that is, YYMMDDHHMMSS plus 2 bytes). Otherwise, it is generalized-time encoded as an 8-byte year precise to milliseconds with a 4-byte year.
     * @type {FILETIME}
     */
    ThisUpdate{
        get {
            if(!this.HasProp("__ThisUpdate"))
                this.__ThisUpdate := FILETIME(this.ptr + 48)
            return this.__ThisUpdate
        }
    }

    /**
     * Indication of the date and time for the CRL's next available scheduled update. If the time is after 1950 and before 2050, it is UTC-time encoded as an 8-byte date/time precise to seconds with a 2-digit year (that is, YYMMDDHHMMSS plus 2 bytes). Otherwise, it is generalized-time encoded as an 8-byte date time precise to milliseconds with a 4-byte year.
     * @type {FILETIME}
     */
    NextUpdate{
        get {
            if(!this.HasProp("__NextUpdate"))
                this.__NextUpdate := FILETIME(this.ptr + 56)
            return this.__NextUpdate
        }
    }

    /**
     * Number of elements in the <b>rgCRLEntry</b> array.
     * @type {Integer}
     */
    cCRLEntry {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crl_entry">CRL_ENTRY</a> structures. Each of these structures represents a revoked certificate.
     * @type {Pointer<CRL_ENTRY>}
     */
    rgCRLEntry {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Number of elements in the <b>rgExtension</b> array.
     * @type {Integer}
     */
    cExtension {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures, each holding information about the CRL.
     * @type {Pointer<CERT_EXTENSION>}
     */
    rgExtension {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }
}
