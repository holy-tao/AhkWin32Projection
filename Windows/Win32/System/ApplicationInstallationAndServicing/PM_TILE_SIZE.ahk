#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_TILE_SIZE {
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
    static PM_TILE_SIZE_SMALL => 0

    /**
     * @type {Integer (Int32)}
     */
    static PM_TILE_SIZE_MEDIUM => 1

    /**
     * @type {Integer (Int32)}
     */
    static PM_TILE_SIZE_LARGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PM_TILE_SIZE_SQUARE310X310 => 3

    /**
     * @type {Integer (Int32)}
     */
    static PM_TILE_SIZE_TALL150X310 => 4

    /**
     * @type {Integer (Int32)}
     */
    static PM_TILE_SIZE_INVALID => 5
}
