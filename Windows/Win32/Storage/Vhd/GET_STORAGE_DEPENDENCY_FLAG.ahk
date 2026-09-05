#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains virtual hard disk (VHD) storage dependency request flags.
 * @remarks
 * If the <b>GET_STORAGE_DEPENDENCY_FLAG_HOST_VOLUMES</b> flag is not set, the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-getstoragedependencyinformation">GetStorageDependencyInformation</a> function returns information about the volumes or disks being hosted by  the volume or disk specified. For example, if the VHD file C:\file.vhd defines the virtual drive D, setting the <b>GET_STORAGE_DEPENDENCY_FLAG_HOST_VOLUMES</b> flag will retrieve information about the C: volume. If not, information about the virtual D: volume will be retrieved.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-get_storage_dependency_flag
 * @namespace Windows.Win32.Storage.Vhd
 */
class GET_STORAGE_DEPENDENCY_FLAG extends Win32BitflagEnum {

    /**
     * No flags specified.
     * Native name: GET_STORAGE_DEPENDENCY_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Return information for volumes or disks hosting the volume specified.
     * Native name: GET_STORAGE_DEPENDENCY_FLAG_HOST_VOLUMES
     * @type {Integer (Int32)}
     */
    static HOST_VOLUMES => 1

    /**
     * The handle provided is to a disk, not a volume or file.
     * Native name: GET_STORAGE_DEPENDENCY_FLAG_DISK_HANDLE
     * @type {Integer (Int32)}
     */
    static DISK_HANDLE => 2
}
