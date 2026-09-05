#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_OBJECT_LOCATOR_RELEASE_REASON extends Win32Enum {

    /**
     * Native name: CRYPT_OBJECT_LOCATOR_RELEASE_SYSTEM_SHUTDOWN
     * @type {Integer (UInt32)}
     */
    static SYSTEM_SHUTDOWN => 1

    /**
     * Native name: CRYPT_OBJECT_LOCATOR_RELEASE_SERVICE_STOP
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP => 2

    /**
     * Native name: CRYPT_OBJECT_LOCATOR_RELEASE_PROCESS_EXIT
     * @type {Integer (UInt32)}
     */
    static PROCESS_EXIT => 3

    /**
     * Native name: CRYPT_OBJECT_LOCATOR_RELEASE_DLL_UNLOAD
     * @type {Integer (UInt32)}
     */
    static DLL_UNLOAD => 4
}
