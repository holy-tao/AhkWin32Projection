#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_TYPE {
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
    static OPM_OMAC_SIZE => 16

    /**
     * @type {Integer (Int32)}
     */
    static OPM_128_BIT_RANDOM_NUMBER_SIZE => 16

    /**
     * @type {Integer (Int32)}
     */
    static OPM_ENCRYPTED_INITIALIZATION_PARAMETERS_SIZE => 256

    /**
     * @type {Integer (Int32)}
     */
    static OPM_CONFIGURE_SETTING_DATA_SIZE => 4056

    /**
     * @type {Integer (Int32)}
     */
    static OPM_GET_INFORMATION_PARAMETERS_SIZE => 4056

    /**
     * @type {Integer (Int32)}
     */
    static OPM_REQUESTED_INFORMATION_SIZE => 4076

    /**
     * @type {Integer (Int32)}
     */
    static OPM_HDCP_KEY_SELECTION_VECTOR_SIZE => 5

    /**
     * @type {Integer (Int32)}
     */
    static OPM_PROTECTION_TYPE_SIZE => 4

    /**
     * @type {Integer (Int32)}
     */
    static OPM_BUS_TYPE_MASK => 65535

    /**
     * @type {Integer (Int32)}
     */
    static OPM_BUS_IMPLEMENTATION_MODIFIER_MASK => 32767
}
