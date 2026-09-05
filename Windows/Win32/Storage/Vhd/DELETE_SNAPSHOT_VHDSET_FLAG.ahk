#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags affecting the behavior of the DeleteSnapshotVhdSet function.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-delete_snapshot_vhdset_flag
 * @namespace Windows.Win32.Storage.Vhd
 */
class DELETE_SNAPSHOT_VHDSET_FLAG extends Win32BitflagEnum {

    /**
     * No flag specified.
     * Native name: DELETE_SNAPSHOT_VHDSET_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * A reference point should be persisted in the VHD Set after the snapshot is deleted.
     * Native name: DELETE_SNAPSHOT_VHDSET_FLAG_PERSIST_RCT
     * @type {Integer (Int32)}
     */
    static PERSIST_RCT => 1
}
