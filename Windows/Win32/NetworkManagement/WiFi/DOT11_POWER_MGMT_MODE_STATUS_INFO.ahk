#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_POWER_MODE_REASON.ahk" { DOT11_POWER_MODE_REASON }
#Import ".\DOT11_POWER_MODE.ahk" { DOT11_POWER_MODE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_POWER_MGMT_MODE_STATUS_INFO {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    PowerSaveMode : DOT11_POWER_MODE

    uPowerSaveLevel : UInt32

    Reason : DOT11_POWER_MODE_REASON

}
