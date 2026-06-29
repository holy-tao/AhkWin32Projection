#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Touch
 */
export default struct GESTURECONFIG_ID {
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
    static GID_BEGIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GID_END => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GID_ZOOM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static GID_PAN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GID_ROTATE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static GID_TWOFINGERTAP => 6

    /**
     * @type {Integer (UInt32)}
     */
    static GID_PRESSANDTAP => 7

    /**
     * @type {Integer (UInt32)}
     */
    static GID_ROLLOVER => 7
}
