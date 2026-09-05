#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags affecting the behavior of the TakeSnapshotVhdSet function.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-take_snapshot_vhdset_flag
 * @namespace Windows.Win32.Storage.Vhd
 */
class TAKE_SNAPSHOT_VHDSET_FLAG extends Win32BitflagEnum {

    /**
     * No flag specified.
     * Native name: TAKE_SNAPSHOT_VHDSET_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: TAKE_SNAPSHOT_VHDSET_FLAG_WRITEABLE
     * @type {Integer (Int32)}
     */
    static WRITEABLE => 1
}
