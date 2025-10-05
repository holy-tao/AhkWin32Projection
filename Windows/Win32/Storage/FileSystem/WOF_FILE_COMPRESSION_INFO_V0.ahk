#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class WOF_FILE_COMPRESSION_INFO_V0 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Algorithm {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
