#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the type of credential used in a client context. The SECPKG_CRED_CLASS enumeration is used in the SecPkgContext_CredInfo structure.
 * @see https://docs.microsoft.com/windows/win32/api//sspi/ne-sspi-secpkg_cred_class
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_CRED_CLASS{

    /**
     * No credentials are supplied.
     * @type {Integer (Int32)}
     */
    static SecPkgCredClass_None => 0

    /**
     * Indicates the credentials used to log on to the system.
     * @type {Integer (Int32)}
     */
    static SecPkgCredClass_Ephemeral => 10

    /**
     * Indicates saved credentials that are not target specific.
     * @type {Integer (Int32)}
     */
    static SecPkgCredClass_PersistedGeneric => 20

    /**
     * Indicates saved credentials that are target specific.
     * @type {Integer (Int32)}
     */
    static SecPkgCredClass_PersistedSpecific => 30

    /**
     * Indicates credentials explicitly supplied by the user.
     * @type {Integer (Int32)}
     */
    static SecPkgCredClass_Explicit => 40
}
