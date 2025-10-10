#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains constants used to distinguish between classes and instances.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/ne-wbemcli-wbem_genus_type
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_GENUS_TYPE{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_GENUS_CLASS => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_GENUS_INSTANCE => 2
}
