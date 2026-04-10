#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class WAIT_OPTION extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static WAIT_MSGPUMP => 1

    /**
     * @type {Integer (Int32)}
     */
    static WAIT_ALERTABLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static WAIT_NOTINDEADLOCK => 4
}
