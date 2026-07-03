#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_DATA_RATE_MAPPING_ENTRY.ahk" { DOT11_DATA_RATE_MAPPING_ENTRY }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_DATA_RATE_MAPPING_TABLE {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    uDataRateMappingLength : UInt32

    DataRateMappingEntries : DOT11_DATA_RATE_MAPPING_ENTRY[126]

}
