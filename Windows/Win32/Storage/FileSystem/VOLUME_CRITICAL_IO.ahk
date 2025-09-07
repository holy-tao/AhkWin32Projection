#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FILE_EXTENT.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class VOLUME_CRITICAL_IO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    AccessType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ExtentsCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<FILE_EXTENT>}
     */
    Extents{
        get {
            if(!this.HasProp("__ExtentsProxyArray"))
                this.__ExtentsProxyArray := Win32FixedArray(this.ptr + 8, 8, FILE_EXTENT, "")
            return this.__ExtentsProxyArray
        }
    }
}
