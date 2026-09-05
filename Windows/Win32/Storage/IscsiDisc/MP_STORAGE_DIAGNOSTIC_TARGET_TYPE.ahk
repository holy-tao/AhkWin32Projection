#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
class MP_STORAGE_DIAGNOSTIC_TARGET_TYPE extends Win32Enum {

    /**
     * Native name: MpStorageDiagnosticTargetTypeUndefined
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Native name: MpStorageDiagnosticTargetTypeMiniport
     * @type {Integer (Int32)}
     */
    static Miniport => 2

    /**
     * Native name: MpStorageDiagnosticTargetTypeHbaFirmware
     * @type {Integer (Int32)}
     */
    static HbaFirmware => 3

    /**
     * Native name: MpStorageDiagnosticTargetTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 4
}
