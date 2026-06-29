#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the version of the DELETE_SNAPHSOT_VHDSET_PARAMETERS structure to use in calls to virtual disk functions.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-delete_snapshot_vhdset_version
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct DELETE_SNAPSHOT_VHDSET_VERSION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static DELETE_SNAPSHOT_VHDSET_VERSION_UNSPECIFIED => 0

    /**
     * The Version1 member structure will be used.
     * @type {Integer (Int32)}
     */
    static DELETE_SNAPSHOT_VHDSET_VERSION_1 => 1
}
