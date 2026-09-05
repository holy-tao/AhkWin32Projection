#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class LockModes extends Win32Enum {

    /**
     * Native name: LockSetGet
     * @type {Integer (Int32)}
     */
    static SetGet => 0

    /**
     * Native name: LockMethod
     * @type {Integer (Int32)}
     */
    static Method => 1
}
