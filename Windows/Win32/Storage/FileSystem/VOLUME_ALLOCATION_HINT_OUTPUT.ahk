#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class VOLUME_ALLOCATION_HINT_OUTPUT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Array<UInt32>}
     */
    Bitmap{
        get {
            if(!this.HasProp("__BitmapProxyArray"))
                this.__BitmapProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "uint")
            return this.__BitmapProxyArray
        }
    }
}
