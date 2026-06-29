#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct BIND_FLAGS1 {
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
    static NCN_ADD => 1

    /**
     * @type {Integer (Int32)}
     */
    static NCN_REMOVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NCN_UPDATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static NCN_ENABLE => 16

    /**
     * @type {Integer (Int32)}
     */
    static NCN_DISABLE => 32

    /**
     * @type {Integer (Int32)}
     */
    static NCN_BINDING_PATH => 256

    /**
     * @type {Integer (Int32)}
     */
    static NCN_PROPERTYCHANGE => 512

    /**
     * @type {Integer (Int32)}
     */
    static NCN_NET => 65536

    /**
     * @type {Integer (Int32)}
     */
    static NCN_NETTRANS => 131072

    /**
     * @type {Integer (Int32)}
     */
    static NCN_NETCLIENT => 262144

    /**
     * @type {Integer (Int32)}
     */
    static NCN_NETSERVICE => 524288
}
