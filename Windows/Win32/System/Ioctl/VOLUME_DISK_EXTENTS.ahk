#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DISK_EXTENT.ahk" { DISK_EXTENT }

/**
 * Represents a physical location on a disk.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-volume_disk_extents
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct VOLUME_DISK_EXTENTS {
    #StructPack 8

    /**
     * The number of disks in the volume (a volume can span multiple disks).
     * 
     * An extent is a contiguous run of sectors on one disk. When the number of extents returned is greater than 
     *        one (1), the error code  <b>ERROR_MORE_DATA</b> is returned. You should call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-deviceiocontrol">DeviceIoControl</a> again, allocating enough buffer 
     *        space based on the value of <b>NumberOfDiskExtents</b> after the first 
     *        <b>DeviceIoControl</b> call.
     */
    NumberOfDiskExtents : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-disk_extent">DISK_EXTENT</a> structures.
     */
    Extents : DISK_EXTENT[1]

}
