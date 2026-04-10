#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_ZONE_DESCRIPTOR_EXTENSION extends Win32Struct {
    static sizeof => 64

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    ZoneDescriptorExtensionInfo {
        get {
            if(!this.HasProp("__ZoneDescriptorExtensionInfoProxyArray"))
                this.__ZoneDescriptorExtensionInfoProxyArray := Win32FixedArray(this.ptr + 0, 64, Primitive, "char")
            return this.__ZoneDescriptorExtensionInfoProxyArray
        }
    }
}
