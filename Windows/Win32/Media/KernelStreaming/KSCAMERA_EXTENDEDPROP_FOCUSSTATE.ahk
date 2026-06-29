#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_FOCUSSTATE {
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
    static KSCAMERA_EXTENDEDPROP_FOCUSSTATE_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUSSTATE_LOST => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUSSTATE_SEARCHING => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUSSTATE_FOCUSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUSSTATE_FAILED => 4
}
