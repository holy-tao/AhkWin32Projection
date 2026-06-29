#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPVESACTIONS {
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
    static SPVES_CONTINUE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPVES_ABORT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPVES_SKIP => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPVES_RATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPVES_VOLUME => 8
}
