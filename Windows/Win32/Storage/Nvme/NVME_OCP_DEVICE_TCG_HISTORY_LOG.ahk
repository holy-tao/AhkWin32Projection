#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TCG_HISTORY_ENTRY.ahk" { TCG_HISTORY_ENTRY }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_OCP_DEVICE_TCG_HISTORY_LOG {
    #StructPack 8

    LID : Int8

    Reserved0 : Int8[3]

    HistoryEntryCount : UInt32

    HistoryEntries : TCG_HISTORY_ENTRY[84]

    Reserved1 : Int8[38]

    LogPageVersionNumber : UInt16

    LogPageGUID : Guid

}
