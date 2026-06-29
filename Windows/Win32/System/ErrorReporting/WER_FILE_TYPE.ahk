#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct WER_FILE_TYPE {
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
    static WerFileTypeMicrodump => 1

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeMinidump => 2

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeHeapdump => 3

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeUserDocument => 4

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeOther => 5

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeTriagedump => 6

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeCustomDump => 7

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeAuxiliaryDump => 8

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeEtlTrace => 9

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeAuxiliaryHeapDump => 10

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeMax => 11
}
