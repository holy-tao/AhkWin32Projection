#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct SERVICE_LOAD_TYPE {
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
    static BootLoad => 0

    /**
     * @type {Integer (Int32)}
     */
    static SystemLoad => 1

    /**
     * @type {Integer (Int32)}
     */
    static AutoLoad => 2

    /**
     * @type {Integer (Int32)}
     */
    static DemandLoad => 3

    /**
     * @type {Integer (Int32)}
     */
    static DisableLoad => 4
}
