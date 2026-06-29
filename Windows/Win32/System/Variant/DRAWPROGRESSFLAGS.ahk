#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Variant
 */
export default struct DRAWPROGRESSFLAGS {
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
    static DPF_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DPF_MARQUEE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DPF_MARQUEE_COMPLETE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DPF_ERROR => 4

    /**
     * @type {Integer (Int32)}
     */
    static DPF_WARNING => 8

    /**
     * @type {Integer (Int32)}
     */
    static DPF_STOPPED => 16
}
