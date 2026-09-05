#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 */
class WBEM_PROVIDER_FLAGS extends Win32Enum {

    /**
     * Native name: WBEM_FLAG_OWNER_UPDATE
     * @type {Integer (Int32)}
     */
    static FLAG_OWNER_UPDATE => 65536
}
