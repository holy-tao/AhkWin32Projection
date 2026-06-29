#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Enumerates the possible versions for parameters for the ResizeVirtualDisk function.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-resize_virtual_disk_version
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct RESIZE_VIRTUAL_DISK_VERSION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The version is not valid.
     * @type {Integer (Int32)}
     */
    static RESIZE_VIRTUAL_DISK_VERSION_UNSPECIFIED => 0

    /**
     * Version one of the parameters is used. This is the only supported value.
     * @type {Integer (Int32)}
     */
    static RESIZE_VIRTUAL_DISK_VERSION_1 => 1
}
