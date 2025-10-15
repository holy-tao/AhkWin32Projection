#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_MANUFACTURING_FUNCTIONAL_TEST_RX extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {BOOLEAN}
     */
    bEnabled{
        get {
            if(!this.HasProp("__bEnabled"))
                this.__bEnabled := BOOLEAN(this.ptr + 0)
            return this.__bEnabled
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
    PowerLevel {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
