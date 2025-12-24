#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FSCTL_QUERY_GHOSTED_FILE_EXTENTS_OUTPUT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ExtentCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TotalExtentCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    Extents{
        get {
            if(!this.HasProp("__ExtentsProxyArray"))
                this.__ExtentsProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__ExtentsProxyArray
        }
    }
}
