#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_LINK_SUBSTATE {
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
    static PciExpressPciPmLinkSubState_L11_BitIndex => 0

    /**
     * @type {Integer (Int32)}
     */
    static PciExpressPciPmLinkSubState_L12_BitIndex => 1

    /**
     * @type {Integer (Int32)}
     */
    static PciExpressASPMLinkSubState_L11_BitIndex => 2

    /**
     * @type {Integer (Int32)}
     */
    static PciExpressASPMLinkSubState_L12_BitIndex => 3
}
