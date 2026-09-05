#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 */
class JET_INDEXCHECKING extends Win32Enum {

    /**
     * Native name: JET_IndexCheckingOff
     * @type {Integer (Int32)}
     */
    static IndexCheckingOff => 0

    /**
     * Native name: JET_IndexCheckingOn
     * @type {Integer (Int32)}
     */
    static IndexCheckingOn => 1

    /**
     * Native name: JET_IndexCheckingDeferToOpenTable
     * @type {Integer (Int32)}
     */
    static IndexCheckingDeferToOpenTable => 2

    /**
     * Native name: JET_IndexCheckingMax
     * @type {Integer (Int32)}
     */
    static IndexCheckingMax => 3
}
