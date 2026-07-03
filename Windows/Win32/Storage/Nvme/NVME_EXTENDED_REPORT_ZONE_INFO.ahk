#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_ZONE_DESCRIPTOR.ahk" { NVME_ZONE_DESCRIPTOR }
#Import ".\NVME_ZONE_DESCRIPTOR_EXTENSION.ahk" { NVME_ZONE_DESCRIPTOR_EXTENSION }
#Import ".\NVME_ZONE_EXTENDED_REPORT_ZONE_DESC.ahk" { NVME_ZONE_EXTENDED_REPORT_ZONE_DESC }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_EXTENDED_REPORT_ZONE_INFO {
    #StructPack 8

    ZoneCount : Int64

    Reserved : Int64[7]

    Desc : NVME_ZONE_EXTENDED_REPORT_ZONE_DESC[1]

}
