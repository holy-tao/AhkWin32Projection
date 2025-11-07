#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CERT_TRUST_STATUS.ahk

/**
 * Contains an array of simple certificate chains and a trust status structure that indicates summary validity data on all of the connected simple chains.
 * @remarks
 * 
 * When a <b>CERT_CHAIN_CONTEXT</b> is built, the first simple chain begins with an end certificate and ends with a self-signed certificate. If that self-signed certificate is not a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">root</a> or otherwise trusted certificate, an attempt is made to build a new chain. <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">CTLs</a> are used to create the new chain beginning with the self-signed certificate from the original chain as the end certificate of the new chain. This process continues building additional simple chains until the first self-signed certificate is a trusted certificate or until an additional simple chain cannot be built.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_chain_context
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_CHAIN_CONTEXT extends Win32Struct
{
    static sizeof => 72

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
     * A structure that indicates the combined trust status of the simple chains array. The structure includes an error status code and an information status code. For information about status code values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_trust_status">CERT_TRUST_STATUS</a>.
     * @type {CERT_TRUST_STATUS}
     */
    TrustStatus{
        get {
            if(!this.HasProp("__TrustStatus"))
                this.__TrustStatus := CERT_TRUST_STATUS(8, this)
            return this.__TrustStatus
        }
    }

    /**
     * The number of simple chains in the array.
     * @type {Integer}
     */
    cChain {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * An array of pointers to simple chain structures. <b>rgpChain</b>[0] is the end certificate simple chain, and <b>rgpChain</b>[<b>cChain</b>–1] is the final chain. If the end certificate is to be considered valid, the final chain must begin with a certificate contained in the root store or an otherwise trusted, self-signed certificate. If the original chain begins with a trusted certificate, there will be only a single simple chain in the array.
     * @type {Pointer<Pointer<CERT_SIMPLE_CHAIN>>}
     */
    rgpChain {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The number of chains in the  <b>rgpLowerQualityChainContext</b> array.
     * @type {Integer}
     */
    cLowerQualityChainContext {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * An array of pointers to CERT_CHAIN_CONTEXT structures. Returned when CERT_CHAIN_RETURN_LOWER_QUALITY_CONTEXTS is set in dwFlags.
     * @type {Pointer<Pointer<CERT_CHAIN_CONTEXT>>}
     */
    rgpLowerQualityChainContext {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A Boolean value set to <b>TRUE</b> if <b>dwRevocationFreshnessTime</b> is available.
     * @type {BOOL}
     */
    fHasRevocationFreshnessTime {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * The largest CurrentTime, in seconds, minus the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list's</a> (CRL's) ThisUpdate of all elements checked.
     * @type {Integer}
     */
    dwRevocationFreshnessTime {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * 
     * @type {Integer}
     */
    dwCreateFlags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * 
     * @type {Pointer<Guid>}
     */
    ChainId {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 72
    }
}
