#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_CONTROLLER_FLAVOR {
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
    static USB_HcGeneric => 0

    /**
     * @type {Integer (Int32)}
     */
    static OHCI_Generic => 100

    /**
     * @type {Integer (Int32)}
     */
    static OHCI_Hydra => 101

    /**
     * @type {Integer (Int32)}
     */
    static OHCI_NEC => 102

    /**
     * @type {Integer (Int32)}
     */
    static UHCI_Generic => 200

    /**
     * @type {Integer (Int32)}
     */
    static UHCI_Piix4 => 201

    /**
     * @type {Integer (Int32)}
     */
    static UHCI_Piix3 => 202

    /**
     * @type {Integer (Int32)}
     */
    static UHCI_Ich2 => 203

    /**
     * @type {Integer (Int32)}
     */
    static UHCI_Reserved204 => 204

    /**
     * @type {Integer (Int32)}
     */
    static UHCI_Ich1 => 205

    /**
     * @type {Integer (Int32)}
     */
    static UHCI_Ich3m => 206

    /**
     * @type {Integer (Int32)}
     */
    static UHCI_Ich4 => 207

    /**
     * @type {Integer (Int32)}
     */
    static UHCI_Ich5 => 208

    /**
     * @type {Integer (Int32)}
     */
    static UHCI_Ich6 => 209

    /**
     * @type {Integer (Int32)}
     */
    static UHCI_Intel => 249

    /**
     * @type {Integer (Int32)}
     */
    static UHCI_VIA => 250

    /**
     * @type {Integer (Int32)}
     */
    static UHCI_VIA_x01 => 251

    /**
     * @type {Integer (Int32)}
     */
    static UHCI_VIA_x02 => 252

    /**
     * @type {Integer (Int32)}
     */
    static UHCI_VIA_x03 => 253

    /**
     * @type {Integer (Int32)}
     */
    static UHCI_VIA_x04 => 254

    /**
     * @type {Integer (Int32)}
     */
    static UHCI_VIA_x0E_FIFO => 264

    /**
     * @type {Integer (Int32)}
     */
    static EHCI_Generic => 1000

    /**
     * @type {Integer (Int32)}
     */
    static EHCI_NEC => 2000

    /**
     * @type {Integer (Int32)}
     */
    static EHCI_Lucent => 3000

    /**
     * @type {Integer (Int32)}
     */
    static EHCI_NVIDIA_Tegra2 => 4000

    /**
     * @type {Integer (Int32)}
     */
    static EHCI_NVIDIA_Tegra3 => 4001

    /**
     * @type {Integer (Int32)}
     */
    static EHCI_Intel_Medfield => 5001
}
