#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
class WLDP_HOST extends Win32Enum {

    /**
     * Native name: WLDP_HOST_RUNDLL32
     * @type {Integer (Int32)}
     */
    static RUNDLL32 => 0

    /**
     * Native name: WLDP_HOST_SVCHOST
     * @type {Integer (Int32)}
     */
    static SVCHOST => 1

    /**
     * Native name: WLDP_HOST_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 2
}
