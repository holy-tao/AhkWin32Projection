#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DOT11_OFFLOAD_TYPE.ahk" { DOT11_OFFLOAD_TYPE }
#Import ".\DOT11_IV48_COUNTER.ahk" { DOT11_IV48_COUNTER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WPA_TSC {
    #StructPack 8

    uReserved : UInt32

    dot11OffloadType : DOT11_OFFLOAD_TYPE

    hOffload : HANDLE

    dot11IV48Counter : DOT11_IV48_COUNTER

}
