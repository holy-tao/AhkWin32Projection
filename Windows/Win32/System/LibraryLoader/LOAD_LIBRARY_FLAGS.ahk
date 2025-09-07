#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.LibraryLoader
 * @version v4.0.30319
 */
class LOAD_LIBRARY_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static DONT_RESOLVE_DLL_REFERENCES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LOAD_LIBRARY_AS_DATAFILE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LOAD_WITH_ALTERED_SEARCH_PATH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LOAD_IGNORE_CODE_AUTHZ_LEVEL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LOAD_LIBRARY_AS_IMAGE_RESOURCE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LOAD_LIBRARY_AS_DATAFILE_EXCLUSIVE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LOAD_LIBRARY_REQUIRE_SIGNED_TARGET => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LOAD_LIBRARY_SEARCH_DLL_LOAD_DIR => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LOAD_LIBRARY_SEARCH_APPLICATION_DIR => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LOAD_LIBRARY_SEARCH_USER_DIRS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LOAD_LIBRARY_SEARCH_SYSTEM32 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static LOAD_LIBRARY_SEARCH_DEFAULT_DIRS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static LOAD_LIBRARY_SAFE_CURRENT_DIRS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static LOAD_LIBRARY_SEARCH_SYSTEM32_NO_FORWARDER => 16384
}
