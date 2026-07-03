#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DOT11_IV48_COUNTER.ahk" { DOT11_IV48_COUNTER }
#Import ".\DOT11_OFFLOAD_TYPE.ahk" { DOT11_OFFLOAD_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WEP_OFFLOAD {
    #StructPack 8

    uReserved : UInt32

    hOffloadContext : HANDLE

    hOffload : HANDLE

    dot11OffloadType : DOT11_OFFLOAD_TYPE

    dwAlgorithm : UInt32

    bRowIsOutbound : BOOLEAN

    bUseDefault : BOOLEAN

    uFlags : UInt32

    ucMacAddress : Int8[6]

    uNumOfRWsOnPeer : UInt32

    uNumOfRWsOnMe : UInt32

    dot11IV48Counters : DOT11_IV48_COUNTER[16]

    usDot11RWBitMaps : UInt16[16]

    usKeyLength : UInt16

    ucKey : Int8[1]

}
