#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NTMS_FILESYSTEM_INFO extends Win32Struct
{
    static sizeof => 644

    static packingSize => 4

    /**
     * @type {String}
     */
    FileSystemType {
        get => StrGet(this.ptr + 0, 63, "UTF-16")
        set => StrPut(value, this.ptr + 0, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    VolumeName {
        get => StrGet(this.ptr + 128, 255, "UTF-16")
        set => StrPut(value, this.ptr + 128, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    SerialNumber {
        get => NumGet(this, 640, "uint")
        set => NumPut("uint", value, this, 640)
    }
}
