#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct CONSTRAINT_CONFLICT_REASON {
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
    static CCR_OTHER => 0

    /**
     * @type {Integer (Int32)}
     */
    static CCR_COLLISION => 1

    /**
     * @type {Integer (Int32)}
     */
    static CCR_NOPARENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static CCR_IDENTITY => 3
}
