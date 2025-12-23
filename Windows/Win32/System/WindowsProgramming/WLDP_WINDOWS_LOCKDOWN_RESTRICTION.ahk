#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class WLDP_WINDOWS_LOCKDOWN_RESTRICTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NOUNLOCK => 1

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NOUNLOCK_PERMANENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_WINDOWS_LOCKDOWN_RESTRICTION_MAX => 3
}
