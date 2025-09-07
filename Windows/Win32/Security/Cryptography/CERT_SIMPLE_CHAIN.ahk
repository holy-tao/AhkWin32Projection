#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CERT_TRUST_STATUS.ahk

/**
 * The CERT_SIMPLE_CHAIN structure contains an array of chain elements and a summary trust status for the chain that the array represents.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_simple_chain
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_SIMPLE_CHAIN extends Win32Struct
{
    static sizeof => 48

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
     * A structure that indicates the trust status of the whole chain. The structure includes an error status code and an information status code. For information about status code values, see <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_trust_status">CERT_TRUST_STATUS</a>.
     * @type {CERT_TRUST_STATUS}
     */
    TrustStatus{
        get {
            if(!this.HasProp("__TrustStatus"))
                this.__TrustStatus := CERT_TRUST_STATUS(this.ptr + 8)
            return this.__TrustStatus
        }
    }

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_element">CERT_CHAIN_ELEMENT</a> structures in the array.
     * @type {Integer}
     */
    cElement {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_element">CERT_CHAIN_ELEMENT</a> structures. <b>rgpElement</b>[0] is the end certificate chain element. <b>rgpElement</b>[<b>cElement</b>–1] is the self-signed "root" certificate element.
     * @type {Pointer<CERT_CHAIN_ELEMENT>}
     */
    rgpElement {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_trust_list_info">CERT_TRUST_LIST_INFO</a> structure that contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate trust list</a> (CTL) connecting this chain to a next certificate chain. If the current chain is the final chain, <b>pTrustListInfo</b> is <b>NULL</b>.
     * @type {Pointer<CERT_TRUST_LIST_INFO>}
     */
    pTrustListInfo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * BOOL. If <b>TRUE</b>, <b>dwRevocationFreshnessTime</b> has been calculated.
     * @type {Integer}
     */
    fHasRevocationFreshnessTime {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * The age of a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list</a> 
     * (CRL) in seconds, calculated as the CurrentTime minus the CRL's ThisUpdate time. This values is the largest time across all elements checked.
     * @type {Integer}
     */
    dwRevocationFreshnessTime {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 48
    }
}
