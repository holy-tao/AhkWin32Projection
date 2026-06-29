#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_BUS_TYPE {
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
    static OPM_BUS_TYPE_OTHER => 0

    /**
     * @type {Integer (Int32)}
     */
    static OPM_BUS_TYPE_PCI => 1

    /**
     * @type {Integer (Int32)}
     */
    static OPM_BUS_TYPE_PCIX => 2

    /**
     * @type {Integer (Int32)}
     */
    static OPM_BUS_TYPE_PCIEXPRESS => 3

    /**
     * @type {Integer (Int32)}
     */
    static OPM_BUS_TYPE_AGP => 4

    /**
     * @type {Integer (Int32)}
     */
    static OPM_BUS_IMPLEMENTATION_MODIFIER_INSIDE_OF_CHIPSET => 65536

    /**
     * @type {Integer (Int32)}
     */
    static OPM_BUS_IMPLEMENTATION_MODIFIER_TRACKS_ON_MOTHER_BOARD_TO_CHIP => 131072

    /**
     * @type {Integer (Int32)}
     */
    static OPM_BUS_IMPLEMENTATION_MODIFIER_TRACKS_ON_MOTHER_BOARD_TO_SOCKET => 196608

    /**
     * @type {Integer (Int32)}
     */
    static OPM_BUS_IMPLEMENTATION_MODIFIER_DAUGHTER_BOARD_CONNECTOR => 262144

    /**
     * @type {Integer (Int32)}
     */
    static OPM_BUS_IMPLEMENTATION_MODIFIER_DAUGHTER_BOARD_CONNECTOR_INSIDE_OF_NUAE => 327680

    /**
     * @type {Integer (Int32)}
     */
    static OPM_BUS_IMPLEMENTATION_MODIFIER_NON_STANDARD => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static OPM_COPP_COMPATIBLE_BUS_TYPE_INTEGRATED => -2147483648
}
