#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_VideoPrimaries {
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
    static DXVA_VideoPrimariesShift => 22

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoPrimariesMask => 130023424

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoPrimaries_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoPrimaries_reserved => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoPrimaries_BT709 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoPrimaries_BT470_2_SysM => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoPrimaries_BT470_2_SysBG => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoPrimaries_SMPTE170M => 5

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoPrimaries_SMPTE240M => 6

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoPrimaries_EBU3213 => 7

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoPrimaries_SMPTE_C => 8
}
