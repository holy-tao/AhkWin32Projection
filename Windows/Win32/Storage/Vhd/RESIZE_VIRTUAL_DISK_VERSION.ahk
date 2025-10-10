#Requires AutoHotkey v2.0.0 64-bit

/**
 * Enumerates the possible versions for parameters for the ResizeVirtualDisk function.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ne-virtdisk-resize_virtual_disk_version
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class RESIZE_VIRTUAL_DISK_VERSION{

    /**
     * The version is not valid.
     * @type {Integer (Int32)}
     */
    static RESIZE_VIRTUAL_DISK_VERSION_UNSPECIFIED => 0

    /**
     * Version one of the parameters is used. This is the only supported value.
     * @type {Integer (Int32)}
     */
    static RESIZE_VIRTUAL_DISK_VERSION_1 => 1
}
