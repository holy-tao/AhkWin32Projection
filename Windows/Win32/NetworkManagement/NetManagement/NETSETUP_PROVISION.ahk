#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class NETSETUP_PROVISION extends Win32BitflagEnum {

    /**
     * Native name: NETSETUP_PROVISION_DOWNLEVEL_PRIV_SUPPORT
     * @type {Integer (UInt32)}
     */
    static DOWNLEVEL_PRIV_SUPPORT => 1

    /**
     * Native name: NETSETUP_PROVISION_REUSE_ACCOUNT
     * @type {Integer (UInt32)}
     */
    static REUSE_ACCOUNT => 2

    /**
     * Native name: NETSETUP_PROVISION_USE_DEFAULT_PASSWORD
     * @type {Integer (UInt32)}
     */
    static USE_DEFAULT_PASSWORD => 4

    /**
     * Native name: NETSETUP_PROVISION_SKIP_ACCOUNT_SEARCH
     * @type {Integer (UInt32)}
     */
    static SKIP_ACCOUNT_SEARCH => 8

    /**
     * Native name: NETSETUP_PROVISION_ROOT_CA_CERTS
     * @type {Integer (UInt32)}
     */
    static ROOT_CA_CERTS => 16
}
