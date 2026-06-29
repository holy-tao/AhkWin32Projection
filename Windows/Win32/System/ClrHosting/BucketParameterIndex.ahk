#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct BucketParameterIndex {
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
    static Parameter1 => 0

    /**
     * @type {Integer (Int32)}
     */
    static Parameter2 => 1

    /**
     * @type {Integer (Int32)}
     */
    static Parameter3 => 2

    /**
     * @type {Integer (Int32)}
     */
    static Parameter4 => 3

    /**
     * @type {Integer (Int32)}
     */
    static Parameter5 => 4

    /**
     * @type {Integer (Int32)}
     */
    static Parameter6 => 5

    /**
     * @type {Integer (Int32)}
     */
    static Parameter7 => 6

    /**
     * @type {Integer (Int32)}
     */
    static Parameter8 => 7

    /**
     * @type {Integer (Int32)}
     */
    static Parameter9 => 8

    /**
     * @type {Integer (Int32)}
     */
    static InvalidBucketParamIndex => 9
}
