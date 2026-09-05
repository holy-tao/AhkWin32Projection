#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_DIAGNOSTIC_TARGET_TYPE extends Win32Enum {

    /**
     * Native name: StorageDiagnosticTargetTypeUndefined
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Native name: StorageDiagnosticTargetTypePort
     * @type {Integer (Int32)}
     */
    static Port => 1

    /**
     * Native name: StorageDiagnosticTargetTypeMiniport
     * @type {Integer (Int32)}
     */
    static Miniport => 2

    /**
     * Native name: StorageDiagnosticTargetTypeHbaFirmware
     * @type {Integer (Int32)}
     */
    static HbaFirmware => 3

    /**
     * Native name: StorageDiagnosticTargetTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 4
}
