#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorImportOptions {
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
    static MDImportOptionDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static MDImportOptionAll => -1

    /**
     * @type {Integer (Int32)}
     */
    static MDImportOptionAllTypeDefs => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDImportOptionAllMethodDefs => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDImportOptionAllFieldDefs => 4

    /**
     * @type {Integer (Int32)}
     */
    static MDImportOptionAllProperties => 8

    /**
     * @type {Integer (Int32)}
     */
    static MDImportOptionAllEvents => 16

    /**
     * @type {Integer (Int32)}
     */
    static MDImportOptionAllCustomAttributes => 32

    /**
     * @type {Integer (Int32)}
     */
    static MDImportOptionAllExportedTypes => 64
}
