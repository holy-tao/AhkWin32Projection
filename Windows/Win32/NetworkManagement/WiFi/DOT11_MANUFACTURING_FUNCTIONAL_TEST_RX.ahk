#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DOT11_BAND.ahk" { DOT11_BAND }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_MANUFACTURING_FUNCTIONAL_TEST_RX {
    #StructPack 4

    bEnabled : BOOLEAN

    Dot11Band : DOT11_BAND

    uChannel : UInt32

    PowerLevel : Int32

}
