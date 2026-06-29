#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSDEGRADE_STANDARD {
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
    static KSDEGRADE_STANDARD_SAMPLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSDEGRADE_STANDARD_QUALITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSDEGRADE_STANDARD_COMPUTATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSDEGRADE_STANDARD_SKIP => 3
}
