#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class WAIT_OPTION extends Win32Enum {

    /**
     * Native name: WAIT_MSGPUMP
     * @type {Integer (Int32)}
     */
    static MSGPUMP => 1

    /**
     * Native name: WAIT_ALERTABLE
     * @type {Integer (Int32)}
     */
    static ALERTABLE => 2

    /**
     * Native name: WAIT_NOTINDEADLOCK
     * @type {Integer (Int32)}
     */
    static NOTINDEADLOCK => 4
}
