#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_ASPM_SUPPORT {
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
    static NoAspmSupport => 0

    /**
     * @type {Integer (Int32)}
     */
    static L0sEntrySupport => 1

    /**
     * @type {Integer (Int32)}
     */
    static L1EntrySupport => 2

    /**
     * @type {Integer (Int32)}
     */
    static L0sAndL1EntrySupport => 3
}
