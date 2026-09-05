#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains virtual hard disk (VHD) mirror request flags.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-mirror_virtual_disk_flag
 * @namespace Windows.Win32.Storage.Vhd
 */
class MIRROR_VIRTUAL_DISK_FLAG extends Win32BitflagEnum {

    /**
     * The mirror virtual disk file does not exist, and needs to be created.
     * Native name: MIRROR_VIRTUAL_DISK_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Create the mirror using an existing file.
     * Native name: MIRROR_VIRTUAL_DISK_FLAG_EXISTING_FILE
     * @type {Integer (Int32)}
     */
    static EXISTING_FILE => 1

    /**
     * Native name: MIRROR_VIRTUAL_DISK_FLAG_SKIP_MIRROR_ACTIVATION
     * @type {Integer (Int32)}
     */
    static SKIP_MIRROR_ACTIVATION => 2

    /**
     * Native name: MIRROR_VIRTUAL_DISK_FLAG_ENABLE_SMB_COMPRESSION
     * @type {Integer (Int32)}
     */
    static ENABLE_SMB_COMPRESSION => 4

    /**
     * Native name: MIRROR_VIRTUAL_DISK_FLAG_IS_LIVE_MIGRATION
     * @type {Integer (Int32)}
     */
    static IS_LIVE_MIGRATION => 8
}
