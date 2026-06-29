#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_TIER_CLASS {
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
    static StorageTierClassUnspecified => 0

    /**
     * @type {Integer (Int32)}
     */
    static StorageTierClassCapacity => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorageTierClassPerformance => 2

    /**
     * @type {Integer (Int32)}
     */
    static StorageTierClassMax => 3
}
