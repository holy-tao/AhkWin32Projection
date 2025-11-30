#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RASENTRY_DIAL_MODE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static RASEDM_DialAll => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASEDM_DialAsNeeded => 2
}
