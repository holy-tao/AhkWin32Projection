#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_AZCC_ROOT_BUS_ERR_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    MaxBusCountPassed : BOOLEAN

    InvalidBusMSR : BOOLEAN

}
