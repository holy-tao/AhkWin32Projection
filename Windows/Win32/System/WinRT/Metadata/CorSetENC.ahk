#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorSetENC {
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
    static MDSetENCOn => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDSetENCOff => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDUpdateENC => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDUpdateFull => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDUpdateExtension => 3

    /**
     * @type {Integer (Int32)}
     */
    static MDUpdateIncremental => 4

    /**
     * @type {Integer (Int32)}
     */
    static MDUpdateDelta => 5

    /**
     * @type {Integer (Int32)}
     */
    static MDUpdateMask => 7
}
