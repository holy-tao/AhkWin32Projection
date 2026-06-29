#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains virtual disk detach request flags.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-detach_virtual_disk_flag
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct DETACH_VIRTUAL_DISK_FLAG {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No flags. Use system defaults.
     * @type {Integer (Int32)}
     */
    static DETACH_VIRTUAL_DISK_FLAG_NONE => 0
}
