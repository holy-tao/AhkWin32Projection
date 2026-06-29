#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FSRTL_COMPARISON_RESULT {
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
    static LessThan => -1

    /**
     * @type {Integer (Int32)}
     */
    static EqualTo => 0

    /**
     * @type {Integer (Int32)}
     */
    static GreaterThan => 1
}
