#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_DIAGNOSTIC_TARGET_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static StorageDiagnosticTargetTypeUndefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static StorageDiagnosticTargetTypePort => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorageDiagnosticTargetTypeMiniport => 2

    /**
     * @type {Integer (Int32)}
     */
    static StorageDiagnosticTargetTypeHbaFirmware => 3

    /**
     * @type {Integer (Int32)}
     */
    static StorageDiagnosticTargetTypeMax => 4
}
