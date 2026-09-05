#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class SCRIPTSTATE extends Win32Enum {

    /**
     * Native name: SCRIPTSTATE_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static UNINITIALIZED => 0

    /**
     * Native name: SCRIPTSTATE_INITIALIZED
     * @type {Integer (Int32)}
     */
    static INITIALIZED => 5

    /**
     * Native name: SCRIPTSTATE_STARTED
     * @type {Integer (Int32)}
     */
    static STARTED => 1

    /**
     * Native name: SCRIPTSTATE_CONNECTED
     * @type {Integer (Int32)}
     */
    static CONNECTED => 2

    /**
     * Native name: SCRIPTSTATE_DISCONNECTED
     * @type {Integer (Int32)}
     */
    static DISCONNECTED => 3

    /**
     * Native name: SCRIPTSTATE_CLOSED
     * @type {Integer (Int32)}
     */
    static CLOSED => 4
}
