#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ERROR_TYPE {
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
    static WheaErrTypeProcessor => 0

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrTypeMemory => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrTypePCIExpress => 2

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrTypeNMI => 3

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrTypePCIXBus => 4

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrTypePCIXDevice => 5

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrTypeGeneric => 6

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrTypePmem => 7
}
