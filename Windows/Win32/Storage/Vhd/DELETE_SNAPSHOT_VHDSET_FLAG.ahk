#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains flags affecting the behavior of the DeleteSnapshotVhdSet function.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ne-virtdisk-delete_snapshot_vhdset_flag
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class DELETE_SNAPSHOT_VHDSET_FLAG{

    /**
     * No flag specified.
     * @type {Integer (Int32)}
     */
    static DELETE_SNAPSHOT_VHDSET_FLAG_NONE => 0

    /**
     * A reference point should be persisted in the VHD Set after the snapshot is deleted.
     * @type {Integer (Int32)}
     */
    static DELETE_SNAPSHOT_VHDSET_FLAG_PERSIST_RCT => 1
}
