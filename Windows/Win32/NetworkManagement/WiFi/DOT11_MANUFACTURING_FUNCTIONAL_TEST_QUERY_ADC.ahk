#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_BAND.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_MANUFACTURING_FUNCTIONAL_TEST_QUERY_ADC extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {DOT11_BAND}
     */
    Dot11Band {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    uChannel {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ADCPowerLevel {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
