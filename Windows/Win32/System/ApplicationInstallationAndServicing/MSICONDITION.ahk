#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class MSICONDITION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MSICONDITION_FALSE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MSICONDITION_TRUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSICONDITION_NONE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSICONDITION_ERROR => 3
}
