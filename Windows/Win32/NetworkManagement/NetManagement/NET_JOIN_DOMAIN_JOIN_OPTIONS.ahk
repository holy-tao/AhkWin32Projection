#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct NET_JOIN_DOMAIN_JOIN_OPTIONS {
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
    static NETSETUP_JOIN_DOMAIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_ACCT_CREATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_WIN9X_UPGRADE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_DOMAIN_JOIN_IF_JOINED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_JOIN_UNSECURE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_MACHINE_PWD_PASSED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_DEFER_SPN_SET => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_JOIN_DC_ACCOUNT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_JOIN_WITH_NEW_NAME => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_JOIN_READONLY => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_AMBIGUOUS_DC => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_NO_NETLOGON_CACHE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_DONT_CONTROL_SERVICES => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_SET_MACHINE_NAME => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_FORCE_SPN_SET => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_NO_ACCT_REUSE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_IGNORE_UNSUPPORTED_FLAGS => 268435456
}
