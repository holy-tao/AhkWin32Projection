#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct VARCMP {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static VARCMP_LT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static VARCMP_EQ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VARCMP_GT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VARCMP_NULL => 3
}
