#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains flags affecting the behavior of the ApplySnapshotVhdSet function.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-apply_snapshot_vhdset_flag
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct APPLY_SNAPSHOT_VHDSET_FLAG {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
