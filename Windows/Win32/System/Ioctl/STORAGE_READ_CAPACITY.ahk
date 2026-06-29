#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about the size of a device. This is returned from the IOCTL\_STORAGE\_READ\_CAPACITY control code.
 * @remarks
 * The header file Ntddstor.h is available in the Windows Driver Kit (WDK).
 * @see https://learn.microsoft.com/windows/win32/DevIO/storage-read-capacity
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_READ_CAPACITY {
    #StructPack 8

    /**
     * The version of this structure. The caller must set this member to `sizeof(STORAGE_READ_CAPACITY)`.
     */
    Version : UInt32

    /**
     * The size of the data returned.
     */
    Size : UInt32

    /**
     * The number of bytes per block.
     */
    BlockLength : UInt32

    /**
     * The total number of blocks on the disk.
     */
    NumberOfBlocks : Int64

    /**
     * The disk size in bytes.
     */
    DiskLength : Int64

}
