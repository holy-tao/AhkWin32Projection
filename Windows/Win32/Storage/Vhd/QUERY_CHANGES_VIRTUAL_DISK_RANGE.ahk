#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies an area on a virtual hard disk (VHD) that has changed as tracked by resilient change tracking (RCT).
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-query_changes_virtual_disk_range
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct QUERY_CHANGES_VIRTUAL_DISK_RANGE {
    #StructPack 8

    /**
     * The distance from the start of the virtual disk to the beginning of  the area of the virtual disk that has changed, in bytes.
     */
    ByteOffset : Int64

    /**
     * The length of the area of the virtual disk that has changed, in bytes.
     */
    ByteLength : Int64

    /**
     * Reserved.
     */
    Reserved : Int64

}
