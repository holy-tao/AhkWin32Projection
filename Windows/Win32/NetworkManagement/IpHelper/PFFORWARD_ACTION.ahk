#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class PFFORWARD_ACTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PF_ACTION_FORWARD => 0

    /**
     * @type {Integer (Int32)}
     */
    static PF_ACTION_DROP => 1
}
