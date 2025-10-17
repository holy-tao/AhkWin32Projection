#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains policy flags returned from a call to the CertVerifyCertificateChainPolicy function.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-ev_extra_cert_chain_policy_status
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class EV_EXTRA_CERT_CHAIN_POLICY_STATUS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwQualifiers {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A <b>DWORD</b> value that specifies an index in the array of the resultant set of policy OIDs for the chain. The index corresponds to the EV policy OID for which the chain is valid. The policy OID is retrieved by using  
     * the index, as shown in the following pseudocode:
     * 
     * <c>pChainContext-&gt;rgpChain[0]-&gt;rgpElement[0]-&gt;pIssuanceUsage-&gt;rgpszUsageIdentifier[dwIssuanceUsageIndex];</c>
     * @type {Integer}
     */
    dwIssuanceUsageIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 12
    }
}
