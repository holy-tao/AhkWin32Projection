#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_XPF_PROCESSOR_ERROR_SECTION extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Pointer<WHEA_XPF_PROCESSOR_ERROR_SECTION_VALIDBITS>}
     */
    ValidBits {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    LocalAPICId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    CpuId{
        get {
            if(!this.HasProp("__CpuIdProxyArray"))
                this.__CpuIdProxyArray := Win32FixedArray(this.ptr + 16, 48, Primitive, "char")
            return this.__CpuIdProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    VariableInfo{
        get {
            if(!this.HasProp("__VariableInfoProxyArray"))
                this.__VariableInfoProxyArray := Win32FixedArray(this.ptr + 64, 1, Primitive, "char")
            return this.__VariableInfoProxyArray
        }
    }
}
