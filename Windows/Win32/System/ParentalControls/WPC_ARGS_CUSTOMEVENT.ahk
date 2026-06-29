#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates information about a user-defined event that is not covered by the general events.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_customevent
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct WPC_ARGS_CUSTOMEVENT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The publisher of the custom event.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CUSTOMEVENT_PUBLISHER => 0

    /**
     * The application name of the custom event.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CUSTOMEVENT_APPNAME => 1

    /**
     * The application version number of the custom event.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CUSTOMEVENT_APPVERSION => 2

    /**
     * The type of event.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CUSTOMEVENT_EVENT => 3

    /**
     * The first  value defined for the custom event.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CUSTOMEVENT_VALUE1 => 4

    /**
     * The second value defined for the custom event.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CUSTOMEVENT_VALUE2 => 5

    /**
     * The third value defined for the custom event.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CUSTOMEVENT_VALUE3 => 6

    /**
     * The custom event is blocked.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CUSTOMEVENT_BLOCKED => 7

    /**
     * The reason for the custom event.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CUSTOMEVENT_REASON => 8

    /**
     * The arguments for the custom event.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CUSTOMEVENT_CARGS => 9
}
