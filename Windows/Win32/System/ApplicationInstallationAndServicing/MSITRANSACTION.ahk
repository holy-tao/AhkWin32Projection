#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct MSITRANSACTION {
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
    static MSITRANSACTION_CHAIN_EMBEDDEDUI => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSITRANSACTION_JOIN_EXISTING_EMBEDDEDUI => 2
}
