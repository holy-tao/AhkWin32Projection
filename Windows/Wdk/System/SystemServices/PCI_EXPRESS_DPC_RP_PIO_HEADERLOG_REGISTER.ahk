#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_EXPRESS_DPC_RP_PIO_HEADERLOG_REGISTER extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Array<Integer>}
     */
    PioHeaderLogRegister {
        get {
            if(!this.HasProp("__PioHeaderLogRegisterProxyArray"))
                this.__PioHeaderLogRegisterProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__PioHeaderLogRegisterProxyArray
        }
    }
}
