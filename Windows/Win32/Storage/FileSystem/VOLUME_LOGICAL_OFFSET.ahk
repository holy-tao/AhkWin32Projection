#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class VOLUME_LOGICAL_OFFSET extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Integer}
     */
    LogicalOffset {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
