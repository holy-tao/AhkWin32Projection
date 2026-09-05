#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about a user-defined event that is not covered by the general events.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_customevent
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_CUSTOMEVENT extends Win32Enum {

    /**
     * The publisher of the custom event.
     * Native name: WPC_ARGS_CUSTOMEVENT_PUBLISHER
     * @type {Integer (Int32)}
     */
    static PUBLISHER => 0

    /**
     * The application name of the custom event.
     * Native name: WPC_ARGS_CUSTOMEVENT_APPNAME
     * @type {Integer (Int32)}
     */
    static APPNAME => 1

    /**
     * The application version number of the custom event.
     * Native name: WPC_ARGS_CUSTOMEVENT_APPVERSION
     * @type {Integer (Int32)}
     */
    static APPVERSION => 2

    /**
     * The type of event.
     * Native name: WPC_ARGS_CUSTOMEVENT_EVENT
     * @type {Integer (Int32)}
     */
    static EVENT => 3

    /**
     * The first  value defined for the custom event.
     * Native name: WPC_ARGS_CUSTOMEVENT_VALUE1
     * @type {Integer (Int32)}
     */
    static VALUE1 => 4

    /**
     * The second value defined for the custom event.
     * Native name: WPC_ARGS_CUSTOMEVENT_VALUE2
     * @type {Integer (Int32)}
     */
    static VALUE2 => 5

    /**
     * The third value defined for the custom event.
     * Native name: WPC_ARGS_CUSTOMEVENT_VALUE3
     * @type {Integer (Int32)}
     */
    static VALUE3 => 6

    /**
     * The custom event is blocked.
     * Native name: WPC_ARGS_CUSTOMEVENT_BLOCKED
     * @type {Integer (Int32)}
     */
    static BLOCKED => 7

    /**
     * The reason for the custom event.
     * Native name: WPC_ARGS_CUSTOMEVENT_REASON
     * @type {Integer (Int32)}
     */
    static REASON => 8

    /**
     * The arguments for the custom event.
     * Native name: WPC_ARGS_CUSTOMEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 9
}
