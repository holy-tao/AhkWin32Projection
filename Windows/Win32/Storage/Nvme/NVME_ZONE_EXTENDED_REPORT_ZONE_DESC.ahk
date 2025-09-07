#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_ZONE_DESCRIPTOR.ahk
#Include .\NVME_ZONE_DESCRIPTOR_EXTENSION.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ZONE_EXTENDED_REPORT_ZONE_DESC extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {NVME_ZONE_DESCRIPTOR}
     */
    ZoneDescriptor{
        get {
            if(!this.HasProp("__ZoneDescriptor"))
                this.__ZoneDescriptor := NVME_ZONE_DESCRIPTOR(this.ptr + 0)
            return this.__ZoneDescriptor
        }
    }

    /**
     * @type {Array<NVME_ZONE_DESCRIPTOR_EXTENSION>}
     */
    ZoneDescriptorExtension{
        get {
            if(!this.HasProp("__ZoneDescriptorExtensionProxyArray"))
                this.__ZoneDescriptorExtensionProxyArray := Win32FixedArray(this.ptr + 64, 8, NVME_ZONE_DESCRIPTOR_EXTENSION, "")
            return this.__ZoneDescriptorExtensionProxyArray
        }
    }
}
