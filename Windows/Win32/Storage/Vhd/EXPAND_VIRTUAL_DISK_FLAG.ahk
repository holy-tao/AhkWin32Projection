#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains virtual hard disk (VHD) expand request flags.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-expand_virtual_disk_flag
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct EXPAND_VIRTUAL_DISK_FLAG {
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
    static EXPAND_VIRTUAL_DISK_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static EXPAND_VIRTUAL_DISK_FLAG_NOTIFY_CHANGE => 1
}
