#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_CONNECT_OPTIONS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_CONNECT_REPOSITORY_ONLY => 64

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_CONNECT_USE_MAX_WAIT => 128

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_CONNECT_PROVIDERS => 256
}
