#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_DPC_RP_PIO_TLPPREFIXLOG_REGISTER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Array<UInt32>}
     */
    PioTlpPrefixLogRegister{
        get {
            if(!this.HasProp("__PioTlpPrefixLogRegisterProxyArray"))
                this.__PioTlpPrefixLogRegisterProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__PioTlpPrefixLogRegisterProxyArray
        }
    }
}
