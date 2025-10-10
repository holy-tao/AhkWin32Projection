#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DISK_EXTENT.ahk

/**
 * Represents a physical location on a disk.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-volume_disk_extents
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class VOLUME_DISK_EXTENTS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of disks in the volume (a volume can span multiple disks).
     * 
     * An extent is a contiguous run of sectors on one disk. When the number of extents returned is greater than 
     *        one (1), the error code  <b>ERROR_MORE_DATA</b> is returned. You should call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-deviceiocontrol">DeviceIoControl</a> again, allocating enough buffer 
     *        space based on the value of <b>NumberOfDiskExtents</b> after the first 
     *        <b>DeviceIoControl</b> call.
     * @type {Integer}
     */
    NumberOfDiskExtents {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-disk_extent">DISK_EXTENT</a> structures.
     * @type {Array<DISK_EXTENT>}
     */
    Extents{
        get {
            if(!this.HasProp("__ExtentsProxyArray"))
                this.__ExtentsProxyArray := Win32FixedArray(this.ptr + 8, 1, DISK_EXTENT, "")
            return this.__ExtentsProxyArray
        }
    }
}
