#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UNormalization2Mode {
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
    static UNORM2_COMPOSE => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNORM2_DECOMPOSE => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNORM2_FCD => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNORM2_COMPOSE_CONTIGUOUS => 3
}
