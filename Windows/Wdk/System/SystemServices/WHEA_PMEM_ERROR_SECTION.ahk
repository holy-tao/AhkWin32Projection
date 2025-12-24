#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHEA_PMEM_PAGE_RANGE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_PMEM_ERROR_SECTION extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Pointer<WHEA_PMEM_ERROR_SECTION_VALIDBITS>}
     */
    ValidBits {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    LocationInfo{
        get {
            if(!this.HasProp("__LocationInfoProxyArray"))
                this.__LocationInfoProxyArray := Win32FixedArray(this.ptr + 8, 64, Primitive, "char")
            return this.__LocationInfoProxyArray
        }
    }

    /**
     * @type {Pointer<WHEA_ERROR_STATUS>}
     */
    ErrorStatus {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    NFITHandle {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    PageRangeCount {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Array<WHEA_PMEM_PAGE_RANGE>}
     */
    PageRange{
        get {
            if(!this.HasProp("__PageRangeProxyArray"))
                this.__PageRangeProxyArray := Win32FixedArray(this.ptr + 88, 1, Primitive, "ptr")
            return this.__PageRangeProxyArray
        }
    }
}
