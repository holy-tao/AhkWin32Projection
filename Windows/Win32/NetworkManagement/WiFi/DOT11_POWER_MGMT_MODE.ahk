#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_POWER_MODE.ahk" { DOT11_POWER_MODE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_POWER_MGMT_MODE {
    #StructPack 4

    dot11PowerMode : DOT11_POWER_MODE

    uPowerSaveLevel : UInt32

    usListenInterval : UInt16

    usAID : UInt16

    bReceiveDTIMs : BOOLEAN

}
