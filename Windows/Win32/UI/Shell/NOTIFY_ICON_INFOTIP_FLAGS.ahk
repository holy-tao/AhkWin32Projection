#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct NOTIFY_ICON_INFOTIP_FLAGS {
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
    static NIIF_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NIIF_INFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NIIF_WARNING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NIIF_ERROR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NIIF_USER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NIIF_ICON_MASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static NIIF_NOSOUND => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NIIF_LARGE_ICON => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NIIF_RESPECT_QUIET_TIME => 128
}
