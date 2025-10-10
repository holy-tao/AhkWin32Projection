#Requires AutoHotkey v2.0.0 64-bit

/**
 * The TERMINAL_STATE enum describes the current state of a terminal device. This enum is returned by the ITTerminal::get_State method.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-terminal_state
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class TERMINAL_STATE{

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
