#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains the version of the MODIFY_VHDSET_PARAMETERS structure to use in calls to virtual disk functions.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-modify_vhdset_version
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class MODIFY_VHDSET_VERSION extends Win32Enum{

    /**
     * Not Supported.
     * @type {Integer (Int32)}
     */
    static MODIFY_VHDSET_UNSPECIFIED => 0

    /**
     * The <b>SnapshotPath</b> member structure will be used.
     * @type {Integer (Int32)}
     */
    static MODIFY_VHDSET_SNAPSHOT_PATH => 1

    /**
     * The <b>SnapshotId</b> member structure will be used.
     * @type {Integer (Int32)}
     */
    static MODIFY_VHDSET_REMOVE_SNAPSHOT => 2

    /**
     * The <b>DefaultFilePath</b> member structure will be used
     * @type {Integer (Int32)}
     */
    static MODIFY_VHDSET_DEFAULT_SNAPSHOT_PATH => 3
}
