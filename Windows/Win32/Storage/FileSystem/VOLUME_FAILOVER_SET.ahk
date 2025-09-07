#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class VOLUME_FAILOVER_SET extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NumberOfDisks {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<UInt32>}
     */
    DiskNumbers{
        get {
            if(!this.HasProp("__DiskNumbersProxyArray"))
                this.__DiskNumbersProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "uint")
            return this.__DiskNumbersProxyArray
        }
    }
}
