#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\UNICODE_STRING.ahk
#Include .\PO_FX_COMPONENT_PERF_SET.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PO_FX_COMPONENT_PERF_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    PerfStateSetsCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<PO_FX_COMPONENT_PERF_SET>}
     */
    PerfStateSets{
        get {
            if(!this.HasProp("__PerfStateSetsProxyArray"))
                this.__PerfStateSetsProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__PerfStateSetsProxyArray
        }
    }
}
