#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The CERT_POLICY_QUALIFIER_INFO structure contains an object identifier (OID) specifying the qualifier and qualifier-specific supplemental information.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_policy_qualifier_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_POLICY_QUALIFIER_INFO {
    #StructPack 8

    /**
     * OID specifying the qualifier.
     */
    pszPolicyQualifierId : PSTR

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_OBJID_BLOB</a> structure that contains qualifier specific supplemental information.
     */
    Qualifier : CRYPT_INTEGER_BLOB

}
