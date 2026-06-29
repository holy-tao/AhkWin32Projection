#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILESYSTEM_STATISTICS_TYPE {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static FILESYSTEM_STATISTICS_TYPE_EXFAT => 3

    /**
     * @type {Integer (UInt16)}
     */
    static FILESYSTEM_STATISTICS_TYPE_FAT => 2

    /**
     * @type {Integer (UInt16)}
     */
    static FILESYSTEM_STATISTICS_TYPE_NTFS => 1
}
