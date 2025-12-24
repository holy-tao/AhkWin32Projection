#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PHYSICAL_COUNTER_RESOURCE_DESCRIPTOR.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PHYSICAL_COUNTER_RESOURCE_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<PHYSICAL_COUNTER_RESOURCE_DESCRIPTOR>}
     */
    Descriptors{
        get {
            if(!this.HasProp("__DescriptorsProxyArray"))
                this.__DescriptorsProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__DescriptorsProxyArray
        }
    }
}
