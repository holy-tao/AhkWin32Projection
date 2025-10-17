#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Cryptography\HCERTCHAINENGINE.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class WTD_GENERIC_CHAIN_POLICY_CREATE_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 4
    }

    /**
     * @type {HCERTCHAINENGINE}
     */
    hChainEngine{
        get {
            if(!this.HasProp("__hChainEngine"))
                this.__hChainEngine := HCERTCHAINENGINE(8, this)
            return this.__hChainEngine
        }
    }

    /**
     * @type {Pointer<CERT_CHAIN_PARA>}
     */
    pChainPara {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvReserved {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
