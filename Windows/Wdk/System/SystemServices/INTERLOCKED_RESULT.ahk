#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct INTERLOCKED_RESULT {
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
    static ResultNegative => 32768

    /**
     * @type {Integer (Int32)}
     */
    static ResultZero => 16384

    /**
     * @type {Integer (Int32)}
     */
    static ResultPositive => 0
}
