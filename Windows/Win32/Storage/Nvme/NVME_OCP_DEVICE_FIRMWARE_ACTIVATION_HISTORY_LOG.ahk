#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FIRMWARE_ACTIVATION_HISTORY_ENTRY.ahk" { FIRMWARE_ACTIVATION_HISTORY_ENTRY }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_OCP_DEVICE_FIRMWARE_ACTIVATION_HISTORY_LOG {
    #StructPack 8

    LID : Int8

    Reserved0 : Int8[3]

    ValidNumberOfEntries : UInt32

    Entries : FIRMWARE_ACTIVATION_HISTORY_ENTRY[20]

    Reserved1 : Int8[2790]

    LogPageVersionNumber : UInt16

    LogPageGUID : Guid

}
