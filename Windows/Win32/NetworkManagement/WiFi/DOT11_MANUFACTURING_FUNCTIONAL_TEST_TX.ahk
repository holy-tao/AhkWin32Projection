#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_MANUFACTURING_FUNCTIONAL_TEST_TX extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {BOOLEAN}
     */
    bEnable{
        get {
            if(!this.HasProp("__bEnable"))
                this.__bEnable := BOOLEAN(this.ptr + 0)
            return this.__bEnable
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bOpenLoop{
        get {
            if(!this.HasProp("__bOpenLoop"))
                this.__bOpenLoop := BOOLEAN(this.ptr + 1)
            return this.__bOpenLoop
        }
    }

    /**
     * @type {Integer}
     */
    Dot11Band {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    uChannel {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    uSetPowerLevel {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ADCPowerLevel {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
