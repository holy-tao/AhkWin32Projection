#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct BALLOONSTEMSTATES {
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
    static TTBSS_POINTINGUPLEFTWALL => 1

    /**
     * @type {Integer (Int32)}
     */
    static TTBSS_POINTINGUPCENTERED => 2

    /**
     * @type {Integer (Int32)}
     */
    static TTBSS_POINTINGUPRIGHTWALL => 3

    /**
     * @type {Integer (Int32)}
     */
    static TTBSS_POINTINGDOWNRIGHTWALL => 4

    /**
     * @type {Integer (Int32)}
     */
    static TTBSS_POINTINGDOWNCENTERED => 5

    /**
     * @type {Integer (Int32)}
     */
    static TTBSS_POINTINGDOWNLEFTWALL => 6
}
