#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
class MP_STORAGE_DIAGNOSTIC_LEVEL extends Win32Enum {

    /**
     * Native name: MpStorageDiagnosticLevelDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Native name: MpStorageDiagnosticLevelMax
     * @type {Integer (Int32)}
     */
    static Max => 1
}
