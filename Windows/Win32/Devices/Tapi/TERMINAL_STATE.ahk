#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TERMINAL_STATE enum describes the current state of a terminal device. This enum is returned by the ITTerminal::get_State method.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-terminal_state
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct TERMINAL_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The terminal is currently in use.
     * @type {Integer (Int32)}
     */
    static TS_INUSE => 0

    /**
     * The terminal is not currently in use.
     * @type {Integer (Int32)}
     */
    static TS_NOTINUSE => 1
}
