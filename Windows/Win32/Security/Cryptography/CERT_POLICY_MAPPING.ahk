#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Contains a mapping between issuer domain and subject domain policy OIDs.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_policy_mapping
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_POLICY_MAPPING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * <b>pszObjId</b> of an issuer domain policy.
     * @type {PSTR}
     */
    pszIssuerDomainPolicy{
        get {
            if(!this.HasProp("__pszIssuerDomainPolicy"))
                this.__pszIssuerDomainPolicy := PSTR(this.ptr + 0)
            return this.__pszIssuerDomainPolicy
        }
    }

    /**
     * <b>pszObjId</b> of the equivalent subject domain policy.
     * @type {PSTR}
     */
    pszSubjectDomainPolicy{
        get {
            if(!this.HasProp("__pszSubjectDomainPolicy"))
                this.__pszSubjectDomainPolicy := PSTR(this.ptr + 8)
            return this.__pszSubjectDomainPolicy
        }
    }
}
