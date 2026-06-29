#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * DDP_FILE_EXTENT represents the extent of data in a file that is to be read in a pending call to ReadBackupFile.
 * @remarks
 * Data Deduplication needs to read only the portions of a container file that back the restore target file.
 * @see https://learn.microsoft.com/windows/win32/api/ddpbackup/ns-ddpbackup-ddp_file_extent
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
export default struct DDP_FILE_EXTENT {
    #StructPack 8

    /**
     * Length, in bytes, of the extent.
     */
    Length : Int64

    /**
     * Offset, in bytes, from the beginning of the file to the beginning of the extent.
     */
    Offset : Int64

}
