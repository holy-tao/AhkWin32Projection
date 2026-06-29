#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TERMINAL_MEDIA_STATE enum indicates the state of a file terminal.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-terminal_media_state
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct TERMINAL_MEDIA_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The file terminal is idle.
     * @type {Integer (Int32)}
     */
    static TMS_IDLE => 0

    /**
     * The file terminal is active.
     * @type {Integer (Int32)}
     */
    static TMS_ACTIVE => 1

    /**
     * The file terminal is paused.
     * @type {Integer (Int32)}
     */
    static TMS_PAUSED => 2

    /**
     * Last item in this enum.
     * @type {Integer (Int32)}
     */
    static TMS_LASTITEM => 2
}
