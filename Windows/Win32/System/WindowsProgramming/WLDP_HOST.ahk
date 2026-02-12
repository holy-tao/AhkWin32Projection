#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the host type of the WLDP caller.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/wldp/ne-wldp-wldp_host_id
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class WLDP_HOST extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_HOST_RUNDLL32 => 0

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_HOST_SVCHOST => 1

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_HOST_MAX => 2
}
