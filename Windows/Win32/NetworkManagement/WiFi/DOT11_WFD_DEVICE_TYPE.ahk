#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WFD_DEVICE_TYPE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * @type {Integer}
     */
    CategoryID {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SubCategoryID {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Array<Byte>}
     */
    OUI{
        get {
            if(!this.HasProp("__OUIProxyArray"))
                this.__OUIProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__OUIProxyArray
        }
    }
}
