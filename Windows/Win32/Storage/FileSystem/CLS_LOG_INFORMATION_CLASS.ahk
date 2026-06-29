#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLS_LOG_INFORMATION_CLASS {
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
    static ClfsLogBasicInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static ClfsLogBasicInformationPhysical => 1

    /**
     * @type {Integer (Int32)}
     */
    static ClfsLogPhysicalNameInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static ClfsLogStreamIdentifierInformation => 3

    /**
     * @type {Integer (Int32)}
     */
    static ClfsLogSystemMarkingInformation => 4

    /**
     * @type {Integer (Int32)}
     */
    static ClfsLogPhysicalLsnInformation => 5
}
