#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_BSS_DESCRIPTION.ahk" { DOT11_BSS_DESCRIPTION }
#Import ".\DOT11_RATE_SET.ahk" { DOT11_RATE_SET }
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_JOIN_REQUEST {
    #StructPack 8

    uJoinFailureTimeout : UInt32

    OperationalRateSet : DOT11_RATE_SET

    uChCenterFrequency : UInt32

    dot11BSSDescription : DOT11_BSS_DESCRIPTION

}
