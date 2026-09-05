#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines some limit values.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_limits
 * @namespace Windows.Win32.System.Wmi
 */
class WBEM_LIMITS extends Win32Enum {

    /**
     * Native name: WBEM_MAX_IDENTIFIER
     * @type {Integer (Int32)}
     */
    static MAX_IDENTIFIER => 4096

    /**
     * Native name: WBEM_MAX_QUERY
     * @type {Integer (Int32)}
     */
    static MAX_QUERY => 16384

    /**
     * Native name: WBEM_MAX_PATH
     * @type {Integer (Int32)}
     */
    static MAX_PATH => 8192

    /**
     * Native name: WBEM_MAX_OBJECT_NESTING
     * @type {Integer (Int32)}
     */
    static MAX_OBJECT_NESTING => 64

    /**
     * Native name: WBEM_MAX_USER_PROPERTIES
     * @type {Integer (Int32)}
     */
    static MAX_USER_PROPERTIES => 1024
}
