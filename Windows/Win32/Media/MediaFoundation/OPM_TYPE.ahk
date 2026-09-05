#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class OPM_TYPE extends Win32Enum {

    /**
     * Native name: OPM_OMAC_SIZE
     * @type {Integer (Int32)}
     */
    static OMAC_SIZE => 16

    /**
     * Native name: OPM_128_BIT_RANDOM_NUMBER_SIZE
     * @type {Integer (Int32)}
     */
    static 128_BIT_RANDOM_NUMBER_SIZE => 16

    /**
     * Native name: OPM_ENCRYPTED_INITIALIZATION_PARAMETERS_SIZE
     * @type {Integer (Int32)}
     */
    static ENCRYPTED_INITIALIZATION_PARAMETERS_SIZE => 256

    /**
     * Native name: OPM_CONFIGURE_SETTING_DATA_SIZE
     * @type {Integer (Int32)}
     */
    static CONFIGURE_SETTING_DATA_SIZE => 4056

    /**
     * Native name: OPM_GET_INFORMATION_PARAMETERS_SIZE
     * @type {Integer (Int32)}
     */
    static GET_INFORMATION_PARAMETERS_SIZE => 4056

    /**
     * Native name: OPM_REQUESTED_INFORMATION_SIZE
     * @type {Integer (Int32)}
     */
    static REQUESTED_INFORMATION_SIZE => 4076

    /**
     * Native name: OPM_HDCP_KEY_SELECTION_VECTOR_SIZE
     * @type {Integer (Int32)}
     */
    static HDCP_KEY_SELECTION_VECTOR_SIZE => 5

    /**
     * Native name: OPM_PROTECTION_TYPE_SIZE
     * @type {Integer (Int32)}
     */
    static PROTECTION_TYPE_SIZE => 4

    /**
     * Native name: OPM_BUS_TYPE_MASK
     * @type {Integer (Int32)}
     */
    static BUS_TYPE_MASK => 65535

    /**
     * Native name: OPM_BUS_IMPLEMENTATION_MODIFIER_MASK
     * @type {Integer (Int32)}
     */
    static BUS_IMPLEMENTATION_MODIFIER_MASK => 32767
}
