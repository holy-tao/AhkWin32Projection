#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags affecting the behavior of the ApplySnapshotVhdSet function.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-apply_snapshot_vhdset_flag
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class APPLY_SNAPSHOT_VHDSET_FLAG extends Win32BitflagEnum{

    /**
     * No flag specified.
     * @type {Integer (Int32)}
     */
    static APPLY_SNAPSHOT_VHDSET_FLAG_NONE => 0

    /**
     * Indicates that the snapshot to be applied was created as a writable snapshot type.
     * @type {Integer (Int32)}
     */
    static APPLY_SNAPSHOT_VHDSET_FLAG_WRITEABLE => 1
}
