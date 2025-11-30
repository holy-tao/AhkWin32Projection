#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHEA_PCIXDEVICE_REGISTER_PAIR.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_PCIXDEVICE_ERROR_SECTION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer<WHEA_PCIXDEVICE_ERROR_SECTION_VALIDBITS>}
     */
    ValidBits {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<WHEA_ERROR_STATUS>}
     */
    ErrorStatus {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<WHEA_PCIXDEVICE_ID>}
     */
    IdInfo {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    MemoryNumber {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    IoNumber {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Array<WHEA_PCIXDEVICE_REGISTER_PAIR>}
     */
    RegisterDataPairs{
        get {
            if(!this.HasProp("__RegisterDataPairsProxyArray"))
                this.__RegisterDataPairsProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "ptr")
            return this.__RegisterDataPairsProxyArray
        }
    }
}
