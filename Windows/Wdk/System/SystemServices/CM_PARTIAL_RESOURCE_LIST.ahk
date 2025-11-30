#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CM_PARTIAL_RESOURCE_DESCRIPTOR.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class CM_PARTIAL_RESOURCE_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<CM_PARTIAL_RESOURCE_DESCRIPTOR>}
     */
    PartialDescriptors{
        get {
            if(!this.HasProp("__PartialDescriptorsProxyArray"))
                this.__PartialDescriptorsProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__PartialDescriptorsProxyArray
        }
    }
}
