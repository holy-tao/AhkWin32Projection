#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_REQUEST_SIZING_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    RequestIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    RequestSizingCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<UInt64>}
     */
    RequestSizing{
        get {
            if(!this.HasProp("__RequestSizingProxyArray"))
                this.__RequestSizingProxyArray := Win32FixedArray(this.ptr + 16, 8, Primitive, "uint")
            return this.__RequestSizingProxyArray
        }
    }
}
