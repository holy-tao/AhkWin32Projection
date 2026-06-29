#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains flags affecting the behavior of the DeleteSnapshotVhdSet function.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-delete_snapshot_vhdset_flag
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct DELETE_SNAPSHOT_VHDSET_FLAG {
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
    static DELETE_SNAPSHOT_VHDSET_FLAG_NONE => 0

    /**
     * A reference point should be persisted in the VHD Set after the snapshot is deleted.
     * @type {Integer (Int32)}
     */
    static DELETE_SNAPSHOT_VHDSET_FLAG_PERSIST_RCT => 1
}
