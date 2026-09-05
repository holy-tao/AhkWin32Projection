#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Enumerates the possible versions for parameters for the TakeSnapshotVhdSet function.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-take_snapshot_vhdset_version
 * @namespace Windows.Win32.Storage.Vhd
 */
class TAKE_SNAPSHOT_VHDSET_VERSION extends Win32Enum {

    /**
     * Not Supported.
     * Native name: TAKE_SNAPSHOT_VHDSET_VERSION_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED => 0

    /**
     * The Version1 member structure will be used.
     * Native name: TAKE_SNAPSHOT_VHDSET_VERSION_1
     * @type {Integer (Int32)}
     */
    static 1 => 1
}
