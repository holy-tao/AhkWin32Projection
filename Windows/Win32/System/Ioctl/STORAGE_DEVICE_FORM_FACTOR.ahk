#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the form factor of a device.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-storage_device_form_factor
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DEVICE_FORM_FACTOR {
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
    static FormFactorUnknown => 0

    /**
     * 3.5-inch nominal form factor.
     * @type {Integer (Int32)}
     */
    static FormFactor3_5 => 1

    /**
     * 2.5-inch nominal form factor.
     * @type {Integer (Int32)}
     */
    static FormFactor2_5 => 2

    /**
     * 1.8-inch nominal form factor.
     * @type {Integer (Int32)}
     */
    static FormFactor1_8 => 3

    /**
     * Less than 1.8-inch nominal form factor.
     * @type {Integer (Int32)}
     */
    static FormFactor1_8Less => 4

    /**
     * Embedded on board.
     * @type {Integer (Int32)}
     */
    static FormFactorEmbedded => 5

    /**
     * Memory card such as SD, CF.
     * @type {Integer (Int32)}
     */
    static FormFactorMemoryCard => 6

    /**
     * mSATA
     * @type {Integer (Int32)}
     */
    static FormFactormSata => 7

    /**
     * M.2
     * @type {Integer (Int32)}
     */
    static FormFactorM_2 => 8

    /**
     * PCIe card plug into slot.
     * @type {Integer (Int32)}
     */
    static FormFactorPCIeBoard => 9

    /**
     * DIMM slot.
     * @type {Integer (Int32)}
     */
    static FormFactorDimm => 10
}
