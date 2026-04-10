#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class EClrUnhandledException extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static eRuntimeDeterminedPolicy => 0

    /**
     * @type {Integer (Int32)}
     */
    static eHostDeterminedPolicy => 1
}
