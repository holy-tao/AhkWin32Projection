#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_MSR_DUMP_SECTION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    MsrDumpBuffer {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MsrDumpLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    MsrDumpData{
        get {
            if(!this.HasProp("__MsrDumpDataProxyArray"))
                this.__MsrDumpDataProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__MsrDumpDataProxyArray
        }
    }
}
