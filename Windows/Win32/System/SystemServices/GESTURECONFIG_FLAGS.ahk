#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct GESTURECONFIG_FLAGS {
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
    static GC_ALLGESTURES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GC_ZOOM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GC_PAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GC_PAN_WITH_SINGLE_FINGER_VERTICALLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GC_PAN_WITH_SINGLE_FINGER_HORIZONTALLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GC_PAN_WITH_GUTTER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GC_PAN_WITH_INERTIA => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GC_ROTATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GC_TWOFINGERTAP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GC_PRESSANDTAP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GC_ROLLOVER => 1
}
