#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WFD_SERVICE_HASH_LIST extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * @type {Integer}
     */
    ServiceHashCount {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    ServiceHash{
        get {
            if(!this.HasProp("__ServiceHashProxyArray"))
                this.__ServiceHashProxyArray := Win32FixedArray(this.ptr + 2, 6, Primitive, "char")
            return this.__ServiceHashProxyArray
        }
    }
}
