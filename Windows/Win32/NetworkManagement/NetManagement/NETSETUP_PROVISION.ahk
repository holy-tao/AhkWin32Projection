#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct NETSETUP_PROVISION {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_PROVISION_DOWNLEVEL_PRIV_SUPPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_PROVISION_REUSE_ACCOUNT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_PROVISION_USE_DEFAULT_PASSWORD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_PROVISION_SKIP_ACCOUNT_SEARCH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_PROVISION_ROOT_CA_CERTS => 16
}
