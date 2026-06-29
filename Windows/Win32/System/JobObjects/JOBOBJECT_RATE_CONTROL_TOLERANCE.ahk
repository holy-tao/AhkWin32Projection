#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.JobObjects
 */
export default struct JOBOBJECT_RATE_CONTROL_TOLERANCE {
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
    static ToleranceLow => 1

    /**
     * @type {Integer (Int32)}
     */
    static ToleranceMedium => 2

    /**
     * @type {Integer (Int32)}
     */
    static ToleranceHigh => 3
}
