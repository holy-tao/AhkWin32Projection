#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_PCIE_CORRECTABLE_ERROR_DEVICES extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * @type {Pointer<WHEA_PCIE_CORRECTABLE_ERROR_DEVICES_VALIDBITS>}
     */
    ValidBits {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<WHEA_PCIE_ADDRESS>}
     */
    Address {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Mask {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<UInt32>}
     */
    CorrectableErrorCount{
        get {
            if(!this.HasProp("__CorrectableErrorCountProxyArray"))
                this.__CorrectableErrorCountProxyArray := Win32FixedArray(this.ptr + 20, 32, Primitive, "uint")
            return this.__CorrectableErrorCountProxyArray
        }
    }
}
