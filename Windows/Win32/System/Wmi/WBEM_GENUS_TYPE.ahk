#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains constants used to distinguish between classes and instances.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_genus_type
 * @namespace Windows.Win32.System.Wmi
 */
class WBEM_GENUS_TYPE extends Win32Enum {

    /**
     * Native name: WBEM_GENUS_CLASS
     * @type {Integer (Int32)}
     */
    static CLASS => 1

    /**
     * Native name: WBEM_GENUS_INSTANCE
     * @type {Integer (Int32)}
     */
    static INSTANCE => 2
}
