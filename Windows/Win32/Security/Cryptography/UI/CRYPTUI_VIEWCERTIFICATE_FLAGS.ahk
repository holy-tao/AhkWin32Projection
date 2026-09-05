#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
class CRYPTUI_VIEWCERTIFICATE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CRYPTUI_HIDE_HIERARCHYPAGE
     * @type {Integer (UInt32)}
     */
    static HIDE_HIERARCHYPAGE => 1

    /**
     * Native name: CRYPTUI_HIDE_DETAILPAGE
     * @type {Integer (UInt32)}
     */
    static HIDE_DETAILPAGE => 2

    /**
     * Native name: CRYPTUI_DISABLE_EDITPROPERTIES
     * @type {Integer (UInt32)}
     */
    static DISABLE_EDITPROPERTIES => 4

    /**
     * Native name: CRYPTUI_ENABLE_EDITPROPERTIES
     * @type {Integer (UInt32)}
     */
    static ENABLE_EDITPROPERTIES => 8

    /**
     * Native name: CRYPTUI_DISABLE_ADDTOSTORE
     * @type {Integer (UInt32)}
     */
    static DISABLE_ADDTOSTORE => 16

    /**
     * Native name: CRYPTUI_ENABLE_ADDTOSTORE
     * @type {Integer (UInt32)}
     */
    static ENABLE_ADDTOSTORE => 32

    /**
     * Native name: CRYPTUI_ACCEPT_DECLINE_STYLE
     * @type {Integer (UInt32)}
     */
    static ACCEPT_DECLINE_STYLE => 64

    /**
     * Native name: CRYPTUI_IGNORE_UNTRUSTED_ROOT
     * @type {Integer (UInt32)}
     */
    static IGNORE_UNTRUSTED_ROOT => 128

    /**
     * Native name: CRYPTUI_DONT_OPEN_STORES
     * @type {Integer (UInt32)}
     */
    static DONT_OPEN_STORES => 256

    /**
     * Native name: CRYPTUI_ONLY_OPEN_ROOT_STORE
     * @type {Integer (UInt32)}
     */
    static ONLY_OPEN_ROOT_STORE => 512

    /**
     * Native name: CRYPTUI_WARN_UNTRUSTED_ROOT
     * @type {Integer (UInt32)}
     */
    static WARN_UNTRUSTED_ROOT => 1024

    /**
     * Native name: CRYPTUI_ENABLE_REVOCATION_CHECKING
     * @type {Integer (UInt32)}
     */
    static ENABLE_REVOCATION_CHECKING => 2048

    /**
     * Native name: CRYPTUI_WARN_REMOTE_TRUST
     * @type {Integer (UInt32)}
     */
    static WARN_REMOTE_TRUST => 4096

    /**
     * Native name: CRYPTUI_DISABLE_EXPORT
     * @type {Integer (UInt32)}
     */
    static DISABLE_EXPORT => 8192

    /**
     * Native name: CRYPTUI_ENABLE_REVOCATION_CHECK_END_CERT
     * @type {Integer (UInt32)}
     */
    static ENABLE_REVOCATION_CHECK_END_CERT => 16384

    /**
     * Native name: CRYPTUI_ENABLE_REVOCATION_CHECK_CHAIN
     * @type {Integer (UInt32)}
     */
    static ENABLE_REVOCATION_CHECK_CHAIN => 32768

    /**
     * Native name: CRYPTUI_ENABLE_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT
     * @type {Integer (UInt32)}
     */
    static ENABLE_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT => 2048

    /**
     * Native name: CRYPTUI_DISABLE_HTMLLINK
     * @type {Integer (UInt32)}
     */
    static DISABLE_HTMLLINK => 65536

    /**
     * Native name: CRYPTUI_DISABLE_ISSUERSTATEMENT
     * @type {Integer (UInt32)}
     */
    static DISABLE_ISSUERSTATEMENT => 131072

    /**
     * Native name: CRYPTUI_CACHE_ONLY_URL_RETRIEVAL
     * @type {Integer (UInt32)}
     */
    static CACHE_ONLY_URL_RETRIEVAL => 262144
}
