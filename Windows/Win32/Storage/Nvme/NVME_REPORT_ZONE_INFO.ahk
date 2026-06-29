#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_ZONE_DESCRIPTOR.ahk" { NVME_ZONE_DESCRIPTOR }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_REPORT_ZONE_INFO {
    #StructPack 8

    ZoneCount : Int64

    Reserved : Int64[7]

    ZoneDescriptor : NVME_ZONE_DESCRIPTOR[1]

}
