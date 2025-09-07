#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class EXPORT_SECURITY_CONTEXT_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CONTEXT_EXPORT_RESET_NEW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CONTEXT_EXPORT_DELETE_OLD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CONTEXT_EXPORT_TO_KERNEL => 4
}
