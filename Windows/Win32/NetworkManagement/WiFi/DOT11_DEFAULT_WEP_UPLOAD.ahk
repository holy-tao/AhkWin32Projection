#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DOT11_OFFLOAD_TYPE.ahk" { DOT11_OFFLOAD_TYPE }
#Import ".\DOT11_IV48_COUNTER.ahk" { DOT11_IV48_COUNTER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_DEFAULT_WEP_UPLOAD {
    #StructPack 8

    uReserved : UInt32

    dot11OffloadType : DOT11_OFFLOAD_TYPE

    hOffload : HANDLE

    uNumOfRWsUsed : UInt32

    dot11IV48Counters : DOT11_IV48_COUNTER[16]

    usDot11RWBitMaps : UInt16[16]

}
