#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_DIAGNOSTIC_LEVEL extends Win32Enum {

    /**
     * Native name: StorageDiagnosticLevelDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Native name: StorageDiagnosticLevelMax
     * @type {Integer (Int32)}
     */
    static Max => 1
}
