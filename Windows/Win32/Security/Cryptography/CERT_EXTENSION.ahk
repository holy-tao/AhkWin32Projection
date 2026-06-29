#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The CERT_EXTENSION structure contains the extension information for a certificate, Certificate Revocation List (CRL) or Certificate Trust List (CTL).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_extension
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_EXTENSION {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">Object identifier</a> (OID) that specifies the structure of the extension data contained in the <b>Value</b> member. For specifics on extension OIDs and their related structures, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-structures">X.509 Certificate Extension Structures</a>.
     */
    pszObjId : PSTR

    /**
     * If <b>TRUE</b>, any limitations specified by the extension in the <b>Value</b> member of this structure are imperative. If <b>FALSE</b>, limitations set by this extension can be ignored.
     */
    fCritical : BOOL

    /**
     * A 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_OBJID_BLOB</a> structure that contains the encoded extension data. The <b>cbData</b> member of <b>Value</b> indicates the length in bytes of the <b>pbData</b> member. The <b>pbData</b> member byte string is the encoded extension.
     */
    Value : CRYPT_INTEGER_BLOB

}
