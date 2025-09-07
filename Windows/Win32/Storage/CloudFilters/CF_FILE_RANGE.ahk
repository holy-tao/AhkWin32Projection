#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a range of data in a placeholder file.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_file_range
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_FILE_RANGE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The offset of the starting point of the data.
     * @type {Integer}
     */
    StartingOffset {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The length of the data, in bytes.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}
