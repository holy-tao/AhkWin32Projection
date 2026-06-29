#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_ZONE_TYPES {
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
    static ZoneTypeUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static ZoneTypeConventional => 1

    /**
     * @type {Integer (Int32)}
     */
    static ZoneTypeSequentialWriteRequired => 2

    /**
     * @type {Integer (Int32)}
     */
    static ZoneTypeSequentialWritePreferred => 3

    /**
     * @type {Integer (Int32)}
     */
    static ZoneTypeMax => 4
}
