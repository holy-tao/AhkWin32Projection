#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DRIVER_RUNTIME_INIT_FLAGS {
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
    static DrvRtPoolNxOptIn => 1

    /**
     * @type {Integer (Int32)}
     */
    static LastDrvRtFlag => 2
}
