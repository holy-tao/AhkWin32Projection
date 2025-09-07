#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_OBJECT_LOCATOR_RELEASE_REASON{

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_OBJECT_LOCATOR_RELEASE_SYSTEM_SHUTDOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_OBJECT_LOCATOR_RELEASE_SERVICE_STOP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_OBJECT_LOCATOR_RELEASE_PROCESS_EXIT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_OBJECT_LOCATOR_RELEASE_DLL_UNLOAD => 4
}
