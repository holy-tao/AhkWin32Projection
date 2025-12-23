#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class MP_STORAGE_DIAGNOSTIC_LEVEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MpStorageDiagnosticLevelDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static MpStorageDiagnosticLevelMax => 1
}
