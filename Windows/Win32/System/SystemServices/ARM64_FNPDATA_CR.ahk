#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct ARM64_FNPDATA_CR {
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
    static PdataCrUnchained => 0

    /**
     * @type {Integer (Int32)}
     */
    static PdataCrUnchainedSavedLr => 1

    /**
     * @type {Integer (Int32)}
     */
    static PdataCrChainedWithPac => 2

    /**
     * @type {Integer (Int32)}
     */
    static PdataCrChained => 3
}
