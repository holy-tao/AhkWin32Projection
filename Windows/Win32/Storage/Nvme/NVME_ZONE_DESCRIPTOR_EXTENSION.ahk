#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_ZONE_DESCRIPTOR_EXTENSION {
    #StructPack 1

    ZoneDescriptorExtensionInfo : Int8[64]

}
