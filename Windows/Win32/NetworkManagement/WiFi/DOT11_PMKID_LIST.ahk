#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_PMKID_ENTRY.ahk" { DOT11_PMKID_ENTRY }
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_PMKID_LIST {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    uNumOfEntries : UInt32

    uTotalNumOfEntries : UInt32

    PMKIDs : DOT11_PMKID_ENTRY[1]

}
