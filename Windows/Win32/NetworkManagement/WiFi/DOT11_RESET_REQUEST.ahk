#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_RESET_REQUEST extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dot11ResetType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    dot11MacAddress{
        get {
            if(!this.HasProp("__dot11MacAddressProxyArray"))
                this.__dot11MacAddressProxyArray := Win32FixedArray(this.ptr + 4, 6, Primitive, "char")
            return this.__dot11MacAddressProxyArray
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bSetDefaultMIB {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }
}
