#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
class WLDP_WINDOWS_LOCKDOWN_RESTRICTION extends Win32Enum {

    /**
     * Native name: WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NOUNLOCK
     * @type {Integer (Int32)}
     */
    static NOUNLOCK => 1

    /**
     * Native name: WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NOUNLOCK_PERMANENT
     * @type {Integer (Int32)}
     */
    static NOUNLOCK_PERMANENT => 2

    /**
     * Native name: WLDP_WINDOWS_LOCKDOWN_RESTRICTION_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3
}
