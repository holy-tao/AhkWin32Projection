#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a disk extent.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-disk_extent
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DISK_EXTENT {
    #StructPack 8

    /**
     * The number of the disk that contains this extent.
     * 
     * This is the same number that is used to construct the name of the disk, for example, the *X* in "\\\\?\\PhysicalDrive*X*" or "\\\\?\\\Harddisk*X*".
     */
    DiskNumber : UInt32

    /**
     * The offset from the beginning of the disk to the extent, in bytes.
     */
    StartingOffset : Int64

    /**
     * The number of bytes in this extent.
     */
    ExtentLength : Int64

}
