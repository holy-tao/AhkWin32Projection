#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_DISCOVER_COMPLETE_PARAMETERS {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    Status : Int32

    uNumOfEntries : UInt32

    uTotalNumOfEntries : UInt32

    uListOffset : UInt32

    uListLength : UInt32

}
