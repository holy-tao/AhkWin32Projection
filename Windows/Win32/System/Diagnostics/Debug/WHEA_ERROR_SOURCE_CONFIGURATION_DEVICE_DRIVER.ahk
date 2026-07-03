#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WHEA_ERROR_SOURCE_CONFIGURATION_DEVICE_DRIVER {
    #StructPack 8

    Version : UInt32

    SourceGuid : Guid

    LogTag : UInt16

    Reserved : Int8[6]

    Initialize : IntPtr

    Uninitialize : IntPtr

    MaxSectionDataLength : UInt32

    MaxSectionsPerReport : UInt32

    CreatorId : Guid

    PartitionId : Guid

}
