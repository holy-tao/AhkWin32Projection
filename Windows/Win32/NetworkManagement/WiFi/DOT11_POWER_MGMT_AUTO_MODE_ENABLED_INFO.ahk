#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_POWER_MGMT_AUTO_MODE_ENABLED_INFO {
    #StructPack 2

    Header : NDIS_OBJECT_HEADER

    bEnabled : BOOLEAN

}
