#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCSI_BUS_DATA.ahk" { SCSI_BUS_DATA }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct SCSI_ADAPTER_BUS_INFO {
    #StructPack 4

    NumberOfBuses : Int8

    BusData : SCSI_BUS_DATA[1]

}
