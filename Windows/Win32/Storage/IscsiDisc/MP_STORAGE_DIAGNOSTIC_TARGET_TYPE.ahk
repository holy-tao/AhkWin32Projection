#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct MP_STORAGE_DIAGNOSTIC_TARGET_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
