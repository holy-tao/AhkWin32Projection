#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class SCRIPTSTATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTSTATE_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTSTATE_INITIALIZED => 5

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTSTATE_STARTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTSTATE_CONNECTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTSTATE_DISCONNECTED => 3

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTSTATE_CLOSED => 4
}
