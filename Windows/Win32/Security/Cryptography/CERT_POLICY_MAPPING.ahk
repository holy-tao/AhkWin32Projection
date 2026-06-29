#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains a mapping between issuer domain and subject domain policy OIDs.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_policy_mapping
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_POLICY_MAPPING {
    #StructPack 8

    /**
     * <b>pszObjId</b> of an issuer domain policy.
     */
    pszIssuerDomainPolicy : PSTR

    /**
     * <b>pszObjId</b> of the equivalent subject domain policy.
     */
    pszSubjectDomainPolicy : PSTR

}
