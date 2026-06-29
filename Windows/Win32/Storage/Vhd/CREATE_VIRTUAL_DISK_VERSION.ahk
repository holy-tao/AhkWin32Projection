#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the version of the virtual disk CREATE_VIRTUAL_DISK_PARAMETERS structure to use in calls to virtual disk functions.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-create_virtual_disk_version
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct CREATE_VIRTUAL_DISK_VERSION {
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
    static CREATE_VIRTUAL_DISK_VERSION_UNSPECIFIED => 0

    /**
     * The <b>Version1</b> member structure will be used.
     * @type {Integer (Int32)}
     */
    static CREATE_VIRTUAL_DISK_VERSION_1 => 1

    /**
     * The <b>Version2</b> member structure will be used.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This value is not supported until Windows 8 and Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static CREATE_VIRTUAL_DISK_VERSION_2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static CREATE_VIRTUAL_DISK_VERSION_3 => 3

    /**
     * @type {Integer (Int32)}
     */
    static CREATE_VIRTUAL_DISK_VERSION_4 => 4
}
