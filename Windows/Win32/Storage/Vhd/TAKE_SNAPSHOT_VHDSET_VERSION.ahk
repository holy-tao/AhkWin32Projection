#Requires AutoHotkey v2.0.0 64-bit

/**
 * Enumerates the possible versions for parameters for the TakeSnapshotVhdSet function.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-take_snapshot_vhdset_version
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class TAKE_SNAPSHOT_VHDSET_VERSION{

    /**
     * Not Supported.
     * @type {Integer (Int32)}
     */
    static TAKE_SNAPSHOT_VHDSET_VERSION_UNSPECIFIED => 0

    /**
     * The Version1 member structure will be used.
     * @type {Integer (Int32)}
     */
    static TAKE_SNAPSHOT_VHDSET_VERSION_1 => 1
}
