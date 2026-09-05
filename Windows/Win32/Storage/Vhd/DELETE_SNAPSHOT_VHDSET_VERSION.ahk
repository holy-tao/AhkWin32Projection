#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains the version of the DELETE_SNAPHSOT_VHDSET_PARAMETERS structure to use in calls to virtual disk functions.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-delete_snapshot_vhdset_version
 * @namespace Windows.Win32.Storage.Vhd
 */
class DELETE_SNAPSHOT_VHDSET_VERSION extends Win32Enum {

    /**
     * Not supported.
     * Native name: DELETE_SNAPSHOT_VHDSET_VERSION_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED => 0

    /**
     * The Version1 member structure will be used.
     * Native name: DELETE_SNAPSHOT_VHDSET_VERSION_1
     * @type {Integer (Int32)}
     */
    static 1 => 1
}
