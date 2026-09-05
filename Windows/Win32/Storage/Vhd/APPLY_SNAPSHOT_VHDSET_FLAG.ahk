#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags affecting the behavior of the ApplySnapshotVhdSet function.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-apply_snapshot_vhdset_flag
 * @namespace Windows.Win32.Storage.Vhd
 */
class APPLY_SNAPSHOT_VHDSET_FLAG extends Win32BitflagEnum {

    /**
     * No flag specified.
     * Native name: APPLY_SNAPSHOT_VHDSET_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Indicates that the snapshot to be applied was created as a writable snapshot type.
     * Native name: APPLY_SNAPSHOT_VHDSET_FLAG_WRITEABLE
     * @type {Integer (Int32)}
     */
    static WRITEABLE => 1
}
