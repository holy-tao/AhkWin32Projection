#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains virtual hard disk (VHD) mirror request flags.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-mirror_virtual_disk_flag
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class MIRROR_VIRTUAL_DISK_FLAG{

    /**
     * The mirror virtual disk file does not exist, and needs to be created.
     * @type {Integer (Int32)}
     */
    static MIRROR_VIRTUAL_DISK_FLAG_NONE => 0

    /**
     * Create the mirror using an existing file.
     * @type {Integer (Int32)}
     */
    static MIRROR_VIRTUAL_DISK_FLAG_EXISTING_FILE => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MIRROR_VIRTUAL_DISK_FLAG_SKIP_MIRROR_ACTIVATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static MIRROR_VIRTUAL_DISK_FLAG_ENABLE_SMB_COMPRESSION => 4

    /**
     * @type {Integer (Int32)}
     */
    static MIRROR_VIRTUAL_DISK_FLAG_IS_LIVE_MIGRATION => 8
}
