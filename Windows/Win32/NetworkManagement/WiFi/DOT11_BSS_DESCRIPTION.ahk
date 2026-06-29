#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_BSS_DESCRIPTION {
    #StructPack 8

    uReserved : UInt32

    dot11BSSID : Int8[6]

    dot11BSSType : DOT11_BSS_TYPE

    usBeaconPeriod : UInt16

    ullTimestamp : Int64

    usCapabilityInformation : UInt16

    uBufferLength : UInt32

    ucBuffer : Int8[1]

}
