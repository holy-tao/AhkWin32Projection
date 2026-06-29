#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct REG_PINFLAG {
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
    static REG_PINFLAG_B_ZERO => 1

    /**
     * @type {Integer (Int32)}
     */
    static REG_PINFLAG_B_RENDERER => 2

    /**
     * @type {Integer (Int32)}
     */
    static REG_PINFLAG_B_MANY => 4

    /**
     * @type {Integer (Int32)}
     */
    static REG_PINFLAG_B_OUTPUT => 8
}
