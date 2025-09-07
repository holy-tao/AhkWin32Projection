#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NETSETUP_PROVISION{

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
