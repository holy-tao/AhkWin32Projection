#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IFILTERMAPPER_MERIT {
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
    static MERIT_PREFERRED => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static MERIT_NORMAL => 6291456

    /**
     * @type {Integer (Int32)}
     */
    static MERIT_UNLIKELY => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static MERIT_DO_NOT_USE => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static MERIT_SW_COMPRESSOR => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static MERIT_HW_COMPRESSOR => 1048656
}
