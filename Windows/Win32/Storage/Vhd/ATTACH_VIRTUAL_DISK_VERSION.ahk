#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the version of the virtual hard disk (VHD) ATTACH_VIRTUAL_DISK_PARAMETERS structure to use in calls to VHD functions.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-attach_virtual_disk_version
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct ATTACH_VIRTUAL_DISK_VERSION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static ATTACH_VIRTUAL_DISK_VERSION_UNSPECIFIED => 0

    /**
     * @type {Integer (Int32)}
     */
    static ATTACH_VIRTUAL_DISK_VERSION_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static ATTACH_VIRTUAL_DISK_VERSION_2 => 2
}
