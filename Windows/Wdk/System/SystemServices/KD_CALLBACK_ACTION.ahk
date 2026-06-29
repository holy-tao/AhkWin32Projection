#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KD_CALLBACK_ACTION {
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
    static KdConfigureDeviceAndContinue => 0

    /**
     * @type {Integer (Int32)}
     */
    static KdSkipDeviceAndContinue => 1

    /**
     * @type {Integer (Int32)}
     */
    static KdConfigureDeviceAndStop => 2

    /**
     * @type {Integer (Int32)}
     */
    static KdSkipDeviceAndStop => 3
}
