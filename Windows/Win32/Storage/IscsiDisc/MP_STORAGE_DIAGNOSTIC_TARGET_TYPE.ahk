#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class MP_STORAGE_DIAGNOSTIC_TARGET_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MpStorageDiagnosticTargetTypeUndefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static MpStorageDiagnosticTargetTypeMiniport => 2

    /**
     * @type {Integer (Int32)}
     */
    static MpStorageDiagnosticTargetTypeHbaFirmware => 3

    /**
     * @type {Integer (Int32)}
     */
    static MpStorageDiagnosticTargetTypeMax => 4
}
