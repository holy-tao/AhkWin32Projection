#Requires AutoHotkey v2.0.0 64-bit

/**
 * Enumerates the available flags for the ResizeVirtualDisk function.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-resize_virtual_disk_flag
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class RESIZE_VIRTUAL_DISK_FLAG{

    /**
     * No flags are specified.
     * @type {Integer (Int32)}
     */
    static RESIZE_VIRTUAL_DISK_FLAG_NONE => 0

    /**
     * If this flag is set, skip checking the virtual disk's partition table to ensure that this truncation is 
 *       safe. Setting this flag can cause unrecoverable data loss; use with care.
     * @type {Integer (Int32)}
     */
    static RESIZE_VIRTUAL_DISK_FLAG_ALLOW_UNSAFE_VIRTUAL_SIZE => 1

    /**
     * If this flag is set, resize the disk to the smallest virtual size possible without truncating past any 
 *       existing partitions. If this is set, the <b>NewSize</b> member in the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/virtdisk/ns-virtdisk-resize_virtual_disk_parameters">RESIZE_VIRTUAL_DISK_PARAMETERS</a> 
 *       structure must be zero.
     * @type {Integer (Int32)}
     */
    static RESIZE_VIRTUAL_DISK_FLAG_RESIZE_TO_SMALLEST_SAFE_VIRTUAL_SIZE => 2
}
