#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a disk extent.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-disk_extent
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DISK_EXTENT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The number of the disk that contains this extent.
     * 
     * This is the same number that is used to construct the name of the disk, for example, the *X* in "\\\\?\\PhysicalDrive*X*" or "\\\\?\\\Harddisk*X*".
     * @type {Integer}
     */
    DiskNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The offset from the beginning of the disk to the extent, in bytes.
     * @type {Integer}
     */
    StartingOffset {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The number of bytes in this extent.
     * @type {Integer}
     */
    ExtentLength {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }
}
