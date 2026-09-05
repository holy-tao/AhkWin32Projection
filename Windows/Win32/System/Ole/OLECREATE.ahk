#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class OLECREATE extends Win32Enum {

    /**
     * Native name: OLECREATE_ZERO
     * @type {Integer (UInt32)}
     */
    static ZERO => 0

    /**
     * Native name: OLECREATE_LEAVERUNNING
     * @type {Integer (UInt32)}
     */
    static LEAVERUNNING => 1
}
