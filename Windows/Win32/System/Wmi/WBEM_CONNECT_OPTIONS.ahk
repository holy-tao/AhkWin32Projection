#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 */
class WBEM_CONNECT_OPTIONS extends Win32Enum {

    /**
     * Native name: WBEM_FLAG_CONNECT_REPOSITORY_ONLY
     * @type {Integer (Int32)}
     */
    static FLAG_CONNECT_REPOSITORY_ONLY => 64

    /**
     * Native name: WBEM_FLAG_CONNECT_USE_MAX_WAIT
     * @type {Integer (Int32)}
     */
    static FLAG_CONNECT_USE_MAX_WAIT => 128

    /**
     * Native name: WBEM_FLAG_CONNECT_PROVIDERS
     * @type {Integer (Int32)}
     */
    static FLAG_CONNECT_PROVIDERS => 256
}
