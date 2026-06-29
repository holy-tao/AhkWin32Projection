#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct msmErrorType {
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
    static msmErrorLanguageUnsupported => 1

    /**
     * @type {Integer (Int32)}
     */
    static msmErrorLanguageFailed => 2

    /**
     * @type {Integer (Int32)}
     */
    static msmErrorExclusion => 3

    /**
     * @type {Integer (Int32)}
     */
    static msmErrorTableMerge => 4

    /**
     * @type {Integer (Int32)}
     */
    static msmErrorResequenceMerge => 5

    /**
     * @type {Integer (Int32)}
     */
    static msmErrorFileCreate => 6

    /**
     * @type {Integer (Int32)}
     */
    static msmErrorDirCreate => 7

    /**
     * @type {Integer (Int32)}
     */
    static msmErrorFeatureRequired => 8
}
