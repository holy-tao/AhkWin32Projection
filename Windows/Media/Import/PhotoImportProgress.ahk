#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * The progress data for an asynchronous photo import operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportprogress
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportProgress extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The number of items that have been imported.
     * @type {Integer}
     */
    ItemsImported {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The total number of items to be imported.
     * @type {Integer}
     */
    TotalItemsToImport {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of bytes that have been imported.
     * @type {Integer}
     */
    BytesImported {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The total number of bytes to be imported.
     * @type {Integer}
     */
    TotalBytesToImport {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The current import progress, expressed as a floating point value from 0 to 1.
     * @type {Float}
     */
    ImportProgress {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }
}
