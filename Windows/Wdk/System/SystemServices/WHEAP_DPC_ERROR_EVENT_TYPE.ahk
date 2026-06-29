#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_DPC_ERROR_EVENT_TYPE {
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
    static WheapDpcErrNoErr => 0

    /**
     * @type {Integer (Int32)}
     */
    static WheapDpcErrBusNotFound => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheapDpcErrDpcedSubtree => 2

    /**
     * @type {Integer (Int32)}
     */
    static WheapDpcErrDeviceIdBad => 3

    /**
     * @type {Integer (Int32)}
     */
    static WheapDpcErrResetFailed => 4

    /**
     * @type {Integer (Int32)}
     */
    static WheapDpcErrNoChildren => 5
}
