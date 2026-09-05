#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of keying module.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_key_module_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IKEEXT_KEY_MODULE_TYPE extends Win32Enum {

    /**
     * Specifies Internet Key Exchange (IKE) keying module.
     * Native name: IKEEXT_KEY_MODULE_IKE
     * @type {Integer (Int32)}
     */
    static IKE => 0

    /**
     * Specifies Authenticated Internet Protocol (AuthIP) keying module.
     * Native name: IKEEXT_KEY_MODULE_AUTHIP
     * @type {Integer (Int32)}
     */
    static AUTHIP => 1

    /**
     * Specifies Internet Key Exchange version 2 (IKEv2) keying module.
     * 
     * Available only on Windows 7, Windows Server 2008 R2, and later.
     * Native name: IKEEXT_KEY_MODULE_IKEV2
     * @type {Integer (Int32)}
     */
    static IKEV2 => 2

    /**
     * Maximum value for testing purposes.
     * Native name: IKEEXT_KEY_MODULE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3
}
