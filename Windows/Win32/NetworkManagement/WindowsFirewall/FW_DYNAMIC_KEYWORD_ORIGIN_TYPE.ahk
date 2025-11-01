#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ne-netfw-fw_dynamic_keyword_origin_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class FW_DYNAMIC_KEYWORD_ORIGIN_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static FW_DYNAMIC_KEYWORD_ORIGIN_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static FW_DYNAMIC_KEYWORD_ORIGIN_LOCAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static FW_DYNAMIC_KEYWORD_ORIGIN_MDM => 2
}
