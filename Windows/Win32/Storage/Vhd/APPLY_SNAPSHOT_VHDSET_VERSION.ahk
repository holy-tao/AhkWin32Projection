#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Enumerates the possible versions for parameters for the ApplySnapshotVhdSet function.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-apply_snapshot_vhdset_version
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct APPLY_SNAPSHOT_VHDSET_VERSION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Not Supported.
     * @type {Integer (Int32)}
     */
    static APPLY_SNAPSHOT_VHDSET_VERSION_UNSPECIFIED => 0

    /**
     * The Version1 member structure will be used.
     * @type {Integer (Int32)}
     */
    static APPLY_SNAPSHOT_VHDSET_VERSION_1 => 1
}
