#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class MSICONDITION extends Win32Enum {

    /**
     * Native name: MSICONDITION_FALSE
     * @type {Integer (Int32)}
     */
    static FALSE => 0

    /**
     * Native name: MSICONDITION_TRUE
     * @type {Integer (Int32)}
     */
    static TRUE => 1

    /**
     * Native name: MSICONDITION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 2

    /**
     * Native name: MSICONDITION_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 3
}
