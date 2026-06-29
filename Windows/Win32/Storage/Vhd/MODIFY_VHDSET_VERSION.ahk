#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the version of the MODIFY_VHDSET_PARAMETERS structure to use in calls to virtual disk functions.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-modify_vhdset_version
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct MODIFY_VHDSET_VERSION {
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
    static MODIFY_VHDSET_UNSPECIFIED => 0

    /**
     * The <b>SnapshotPath</b> member structure will be used.
     * @type {Integer (Int32)}
     */
    static MODIFY_VHDSET_SNAPSHOT_PATH => 1

    /**
     * The <b>SnapshotId</b> member structure will be used.
     * @type {Integer (Int32)}
     */
    static MODIFY_VHDSET_REMOVE_SNAPSHOT => 2

    /**
     * The <b>DefaultFilePath</b> member structure will be used
     * @type {Integer (Int32)}
     */
    static MODIFY_VHDSET_DEFAULT_SNAPSHOT_PATH => 3
}
