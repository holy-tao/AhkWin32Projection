#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * DDP_FILE_EXTENT represents the extent of data in a file that is to be read in a pending call to ReadBackupFile.
 * @remarks
 * 
 * Data Deduplication needs to read only the portions of a container file that back the restore target file.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ddpbackup/ns-ddpbackup-ddp_file_extent
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class DDP_FILE_EXTENT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Length, in bytes, of the extent.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * Offset, in bytes, from the beginning of the file to the beginning of the extent.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}
