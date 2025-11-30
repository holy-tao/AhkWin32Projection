#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains the version of the DELETE_SNAPHSOT_VHDSET_PARAMETERS structure to use in calls to virtual disk functions.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ne-virtdisk-delete_snapshot_vhdset_version
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class DELETE_SNAPSHOT_VHDSET_VERSION extends Win32Enum{

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static DELETE_SNAPSHOT_VHDSET_VERSION_UNSPECIFIED => 0

    /**
     * The Version1 member structure will be used.
     * @type {Integer (Int32)}
     */
    static DELETE_SNAPSHOT_VHDSET_VERSION_1 => 1
}
