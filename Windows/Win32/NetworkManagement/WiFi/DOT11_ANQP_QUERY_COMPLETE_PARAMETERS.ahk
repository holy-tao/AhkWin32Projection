#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_ANQP_QUERY_RESULT.ahk" { DOT11_ANQP_QUERY_RESULT }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_ANQP_QUERY_COMPLETE_PARAMETERS {
    #StructPack 8

    Header : NDIS_OBJECT_HEADER

    Status : DOT11_ANQP_QUERY_RESULT

    hContext : HANDLE

    uResponseLength : UInt32

}
