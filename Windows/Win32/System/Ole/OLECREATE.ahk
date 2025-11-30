#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLECREATE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static OLECREATE_ZERO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OLECREATE_LEAVERUNNING => 1
}
