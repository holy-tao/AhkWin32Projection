#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wldp/ne-wldp-wldp_windows_lockdown_mode
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class WLDP_WINDOWS_LOCKDOWN_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_WINDOWS_LOCKDOWN_MODE_UNLOCKED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_WINDOWS_LOCKDOWN_MODE_TRIAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_WINDOWS_LOCKDOWN_MODE_LOCKED => 2

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_WINDOWS_LOCKDOWN_MODE_MAX => 3
}
