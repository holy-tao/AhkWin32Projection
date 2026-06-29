#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct MP_STORAGE_DIAGNOSTIC_LEVEL {
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
    static MpStorageDiagnosticLevelDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static MpStorageDiagnosticLevelMax => 1
}
