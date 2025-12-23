#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class WINTRUST_DATA_PROVIDER_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_USE_IE4_TRUST_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_NO_IE4_CHAIN_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_NO_POLICY_USAGE_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_REVOCATION_CHECK_NONE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_REVOCATION_CHECK_END_CERT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_REVOCATION_CHECK_CHAIN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_SAFER_FLAG => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_HASH_ONLY_FLAG => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_USE_DEFAULT_OSVER_CHECK => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_LIFETIME_SIGNING_FLAG => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_CACHE_ONLY_URL_RETRIEVAL => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_DISABLE_MD2_MD4 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_MOTW => 16384
}
