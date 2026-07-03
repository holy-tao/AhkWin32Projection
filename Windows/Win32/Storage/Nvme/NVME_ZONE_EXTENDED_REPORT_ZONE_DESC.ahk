#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_ZONE_DESCRIPTOR.ahk" { NVME_ZONE_DESCRIPTOR }
#Import ".\NVME_ZONE_DESCRIPTOR_EXTENSION.ahk" { NVME_ZONE_DESCRIPTOR_EXTENSION }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_ZONE_EXTENDED_REPORT_ZONE_DESC {
    #StructPack 8

    ZoneDescriptor : NVME_ZONE_DESCRIPTOR

    ZoneDescriptorExtension : NVME_ZONE_DESCRIPTOR_EXTENSION[1]

}
