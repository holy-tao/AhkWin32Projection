#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class EClrUnhandledException extends Win32Enum {

    /**
     * Native name: eRuntimeDeterminedPolicy
     * @type {Integer (Int32)}
     */
    static RuntimeDeterminedPolicy => 0

    /**
     * Native name: eHostDeterminedPolicy
     * @type {Integer (Int32)}
     */
    static HostDeterminedPolicy => 1
}
