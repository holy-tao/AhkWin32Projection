#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_VPDev {
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
    static DXVA2_VPDev_HardwareDevice => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VPDev_EmulatedDXVA1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VPDev_SoftwareDevice => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VPDev_Mask => 7
}
