#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines some limit values.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_limits
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_LIMITS extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_MAX_IDENTIFIER => 4096

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_MAX_QUERY => 16384

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_MAX_PATH => 8192

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_MAX_OBJECT_NESTING => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_MAX_USER_PROPERTIES => 1024
}
