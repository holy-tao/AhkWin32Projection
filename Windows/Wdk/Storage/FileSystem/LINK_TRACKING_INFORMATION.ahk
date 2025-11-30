#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class LINK_TRACKING_INFORMATION extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    VolumeId{
        get {
            if(!this.HasProp("__VolumeIdProxyArray"))
                this.__VolumeIdProxyArray := Win32FixedArray(this.ptr + 4, 16, Primitive, "char")
            return this.__VolumeIdProxyArray
        }
    }
}
