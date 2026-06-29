#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct COMPONENT_CHARACTERISTICS {
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
    static NCF_VIRTUAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static NCF_SOFTWARE_ENUMERATED => 2

    /**
     * @type {Integer (Int32)}
     */
    static NCF_PHYSICAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static NCF_HIDDEN => 8

    /**
     * @type {Integer (Int32)}
     */
    static NCF_NO_SERVICE => 16

    /**
     * @type {Integer (Int32)}
     */
    static NCF_NOT_USER_REMOVABLE => 32

    /**
     * @type {Integer (Int32)}
     */
    static NCF_MULTIPORT_INSTANCED_ADAPTER => 64

    /**
     * @type {Integer (Int32)}
     */
    static NCF_HAS_UI => 128

    /**
     * @type {Integer (Int32)}
     */
    static NCF_SINGLE_INSTANCE => 256

    /**
     * @type {Integer (Int32)}
     */
    static NCF_FILTER => 1024

    /**
     * @type {Integer (Int32)}
     */
    static NCF_DONTEXPOSELOWER => 4096

    /**
     * @type {Integer (Int32)}
     */
    static NCF_HIDE_BINDING => 8192

    /**
     * @type {Integer (Int32)}
     */
    static NCF_NDIS_PROTOCOL => 16384

    /**
     * @type {Integer (Int32)}
     */
    static NCF_FIXED_BINDING => 131072

    /**
     * @type {Integer (Int32)}
     */
    static NCF_LW_FILTER => 262144
}
