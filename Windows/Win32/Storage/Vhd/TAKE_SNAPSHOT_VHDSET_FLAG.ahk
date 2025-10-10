#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains flags affecting the behavior of the TakeSnapshotVhdSet function.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ne-virtdisk-take_snapshot_vhdset_flag
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class TAKE_SNAPSHOT_VHDSET_FLAG{

    /**
     * No flag specified.
     * @type {Integer (Int32)}
     */
    static TAKE_SNAPSHOT_VHDSET_FLAG_NONE => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TAKE_SNAPSHOT_VHDSET_FLAG_WRITEABLE => 1
}
