#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains the version of the virtual disk MIRROR_VIRTUAL_DISK_PARAMETERS structure used by the MirrorVirtualDisk function.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-mirror_virtual_disk_version
 * @namespace Windows.Win32.Storage.Vhd
 */
class MIRROR_VIRTUAL_DISK_VERSION extends Win32Enum {

    /**
     * Unsupported.
     * Native name: MIRROR_VIRTUAL_DISK_VERSION_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED => 0

    /**
     * Use the <b>Version1</b> member.
     * Native name: MIRROR_VIRTUAL_DISK_VERSION_1
     * @type {Integer (Int32)}
     */
    static 1 => 1
}
