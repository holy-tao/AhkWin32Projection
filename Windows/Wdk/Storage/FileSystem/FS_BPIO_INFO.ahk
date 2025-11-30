#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FS_BPIO_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ActiveBypassIoCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    StorageDriverNameLen {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {String}
     */
    StorageDriverName {
        get => StrGet(this.ptr + 6, 31, "UTF-16")
        set => StrPut(value, this.ptr + 6, 31, "UTF-16")
    }
}
