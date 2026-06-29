#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct RD_FARM_TYPE {
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
    static RD_FARM_RDSH => 0

    /**
     * @type {Integer (Int32)}
     */
    static RD_FARM_TEMP_VM => 1

    /**
     * @type {Integer (Int32)}
     */
    static RD_FARM_MANUAL_PERSONAL_VM => 2

    /**
     * @type {Integer (Int32)}
     */
    static RD_FARM_AUTO_PERSONAL_VM => 3

    /**
     * @type {Integer (Int32)}
     */
    static RD_FARM_MANUAL_PERSONAL_RDSH => 4

    /**
     * @type {Integer (Int32)}
     */
    static RD_FARM_AUTO_PERSONAL_RDSH => 5

    /**
     * @type {Integer (Int32)}
     */
    static RD_FARM_TYPE_UNKNOWN => -1
}
