#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information used in CertVerifyCertificateChainPolicy to establish policy criteria for the verification of certificate chains.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_chain_policy_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_CHAIN_POLICY_PARA extends Win32Struct
{
    static sizeof => 16

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
     * A set of flags that indicate conditions that could potentially be not valid and that are to be ignored in building certificate chains.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The address of a pszPolicyOID-specific structure that provides additional validity policy conditions.
     * @type {Pointer<Void>}
     */
    pvExtraPolicyPara {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 16
    }
}
