#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_WCS_DEVICE_SMART_ATTRIBUTES_LOG {
    #StructPack 4

    VersionSpecificData : Int8[494]

    LogPageVersionNumber : UInt16

    LogPageGUID : Guid

}
