#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_POWER_MODE.ahk" { DOT11_POWER_MODE }
#Import ".\DOT11_ASSOCIATION_INFO_EX.ahk" { DOT11_ASSOCIATION_INFO_EX }
#Import ".\DOT11_ASSOCIATION_STATE.ahk" { DOT11_ASSOCIATION_STATE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_ASSOCIATION_INFO_LIST {
    #StructPack 8

    Header : NDIS_OBJECT_HEADER

    uNumOfEntries : UInt32

    uTotalNumOfEntries : UInt32

    dot11AssocInfo : DOT11_ASSOCIATION_INFO_EX[1]

}
