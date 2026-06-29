#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_ACS_BIT {
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
    static PciAcsReserved => 0

    /**
     * @type {Integer (Int32)}
     */
    static PciAcsBitEnable => 1

    /**
     * @type {Integer (Int32)}
     */
    static PciAcsBitDisable => 2

    /**
     * @type {Integer (Int32)}
     */
    static PciAcsBitDontCare => 3
}
