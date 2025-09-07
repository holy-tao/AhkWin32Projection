#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class CRYPTUI_VIEWCERTIFICATE_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_HIDE_HIERARCHYPAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_HIDE_DETAILPAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_DISABLE_EDITPROPERTIES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_ENABLE_EDITPROPERTIES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_DISABLE_ADDTOSTORE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_ENABLE_ADDTOSTORE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_ACCEPT_DECLINE_STYLE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_IGNORE_UNTRUSTED_ROOT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_DONT_OPEN_STORES => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_ONLY_OPEN_ROOT_STORE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WARN_UNTRUSTED_ROOT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_ENABLE_REVOCATION_CHECKING => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WARN_REMOTE_TRUST => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_DISABLE_EXPORT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_ENABLE_REVOCATION_CHECK_END_CERT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_ENABLE_REVOCATION_CHECK_CHAIN => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_ENABLE_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_DISABLE_HTMLLINK => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_DISABLE_ISSUERSTATEMENT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_CACHE_ONLY_URL_RETRIEVAL => 262144
}
