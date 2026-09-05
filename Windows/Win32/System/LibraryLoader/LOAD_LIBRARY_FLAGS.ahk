#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.LibraryLoader
 */
class LOAD_LIBRARY_FLAGS extends Win32BitflagEnum {

    /**
     * @type {Integer (UInt32)}
     */
    static DONT_RESOLVE_DLL_REFERENCES => 1

    /**
     * Native name: LOAD_LIBRARY_AS_DATAFILE
     * @type {Integer (UInt32)}
     */
    static AS_DATAFILE => 2

    /**
     * Native name: LOAD_WITH_ALTERED_SEARCH_PATH
     * @type {Integer (UInt32)}
     */
    static WITH_ALTERED_SEARCH_PATH => 8

    /**
     * Native name: LOAD_IGNORE_CODE_AUTHZ_LEVEL
     * @type {Integer (UInt32)}
     */
    static IGNORE_CODE_AUTHZ_LEVEL => 16

    /**
     * Native name: LOAD_LIBRARY_AS_IMAGE_RESOURCE
     * @type {Integer (UInt32)}
     */
    static AS_IMAGE_RESOURCE => 32

    /**
     * Native name: LOAD_LIBRARY_AS_DATAFILE_EXCLUSIVE
     * @type {Integer (UInt32)}
     */
    static AS_DATAFILE_EXCLUSIVE => 64

    /**
     * Native name: LOAD_LIBRARY_REQUIRE_SIGNED_TARGET
     * @type {Integer (UInt32)}
     */
    static REQUIRE_SIGNED_TARGET => 128

    /**
     * Native name: LOAD_LIBRARY_SEARCH_DLL_LOAD_DIR
     * @type {Integer (UInt32)}
     */
    static SEARCH_DLL_LOAD_DIR => 256

    /**
     * Native name: LOAD_LIBRARY_SEARCH_APPLICATION_DIR
     * @type {Integer (UInt32)}
     */
    static SEARCH_APPLICATION_DIR => 512

    /**
     * Native name: LOAD_LIBRARY_SEARCH_USER_DIRS
     * @type {Integer (UInt32)}
     */
    static SEARCH_USER_DIRS => 1024

    /**
     * Native name: LOAD_LIBRARY_SEARCH_SYSTEM32
     * @type {Integer (UInt32)}
     */
    static SEARCH_SYSTEM32 => 2048

    /**
     * Native name: LOAD_LIBRARY_SEARCH_DEFAULT_DIRS
     * @type {Integer (UInt32)}
     */
    static SEARCH_DEFAULT_DIRS => 4096

    /**
     * Native name: LOAD_LIBRARY_SAFE_CURRENT_DIRS
     * @type {Integer (UInt32)}
     */
    static SAFE_CURRENT_DIRS => 8192

    /**
     * Native name: LOAD_LIBRARY_SEARCH_SYSTEM32_NO_FORWARDER
     * @type {Integer (UInt32)}
     */
    static SEARCH_SYSTEM32_NO_FORWARDER => 16384
}
