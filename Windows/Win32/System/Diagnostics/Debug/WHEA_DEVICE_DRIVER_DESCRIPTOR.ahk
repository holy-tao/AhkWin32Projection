#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\WHEA_ERROR_SOURCE_CONFIGURATION_DD.ahk" { WHEA_ERROR_SOURCE_CONFIGURATION_DD }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WHEA_DEVICE_DRIVER_DESCRIPTOR {
    #StructPack 8

    Type : UInt16

    Enabled : BOOLEAN

    Reserved : Int8

    SourceGuid : Guid

    LogTag : UInt16

    Reserved2 : UInt16

    PacketLength : UInt32

    PacketCount : UInt32

    PacketBuffer : IntPtr

    Config : WHEA_ERROR_SOURCE_CONFIGURATION_DD

    CreatorId : Guid

    PartitionId : Guid

    MaxSectionDataLength : UInt32

    MaxSectionsPerRecord : UInt32

    PacketStateBuffer : IntPtr

    OpenHandles : Int32

}
