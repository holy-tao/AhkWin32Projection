#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class VOLUME_NUMBER extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    VolumeNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {String}
     */
    VolumeManagerName {
        get => StrGet(this.ptr + 4, 7, "UTF-16")
        set => StrPut(value, this.ptr + 4, 7, "UTF-16")
    }
}
