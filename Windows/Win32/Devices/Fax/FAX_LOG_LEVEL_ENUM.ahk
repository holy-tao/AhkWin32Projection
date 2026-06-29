#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FAX_LOG_LEVEL_ENUM enumeration defines the event logging levels for a logging category.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/ne-faxcomex-fax_log_level_enum
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct FAX_LOG_LEVEL_ENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The fax server does not log events.
     * @type {Integer (Int32)}
     */
    static fllNONE => 0

    /**
     * The fax server logs only severe failure events, such as errors.
     * @type {Integer (Int32)}
     */
    static fllMIN => 1

    /**
     * The fax server logs events of moderate severity, as well as severe failure events. This would include errors and warnings.
     * @type {Integer (Int32)}
     */
    static fllMED => 2

    /**
     * The fax server logs all events.
     * @type {Integer (Int32)}
     */
    static fllMAX => 3
}
