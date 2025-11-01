#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HCERTSTORE.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-spc-chain-info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SIGNER_SPC_CHAIN_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pwszSpcFile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwCertPolicy {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {HCERTSTORE}
     */
    hCertStore{
        get {
            if(!this.HasProp("__hCertStore"))
                this.__hCertStore := HCERTSTORE(24, this)
            return this.__hCertStore
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 32
    }
}
