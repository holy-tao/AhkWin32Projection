#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_SUPPORTED_PHY_TYPES extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    uNumOfEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    uTotalNumOfEntries {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Int32>}
     */
    dot11PHYType{
        get {
            if(!this.HasProp("__dot11PHYTypeProxyArray"))
                this.__dot11PHYTypeProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "int")
            return this.__dot11PHYTypeProxyArray
        }
    }
}
