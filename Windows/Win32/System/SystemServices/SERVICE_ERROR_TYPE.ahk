#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct SERVICE_ERROR_TYPE {
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
    static IgnoreError => 0

    /**
     * @type {Integer (Int32)}
     */
    static NormalError => 1

    /**
     * @type {Integer (Int32)}
     */
    static SevereError => 2

    /**
     * @type {Integer (Int32)}
     */
    static CriticalError => 3
}
