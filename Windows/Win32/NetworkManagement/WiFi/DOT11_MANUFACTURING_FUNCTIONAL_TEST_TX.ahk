#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DOT11_BAND.ahk" { DOT11_BAND }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_MANUFACTURING_FUNCTIONAL_TEST_TX {
    #StructPack 4

    bEnable : BOOLEAN

    bOpenLoop : BOOLEAN

    Dot11Band : DOT11_BAND

    uChannel : UInt32

    uSetPowerLevel : UInt32

    ADCPowerLevel : Int32

}
