#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * HDV_PCI_BAR_SELECTOR Enumeration
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvPciBarSelector
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct HDV_PCI_BAR_SELECTOR {
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
    static HDV_PCI_BAR0 => 0

    /**
     * @type {Integer (Int32)}
     */
    static HDV_PCI_BAR1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static HDV_PCI_BAR2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static HDV_PCI_BAR3 => 3

    /**
     * @type {Integer (Int32)}
     */
    static HDV_PCI_BAR4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static HDV_PCI_BAR5 => 5
}
