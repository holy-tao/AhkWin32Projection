#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_explorerpanestate
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _EXPLORERPANESTATE{

    /**
     * @type {Integer (Int32)}
     */
    static EPS_DONTCARE => 0

    /**
     * @type {Integer (Int32)}
     */
    static EPS_DEFAULT_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static EPS_DEFAULT_OFF => 2

    /**
     * @type {Integer (Int32)}
     */
    static EPS_STATEMASK => 65535

    /**
     * @type {Integer (Int32)}
     */
    static EPS_INITIALSTATE => 65536

    /**
     * @type {Integer (Int32)}
     */
    static EPS_FORCE => 131072
}
