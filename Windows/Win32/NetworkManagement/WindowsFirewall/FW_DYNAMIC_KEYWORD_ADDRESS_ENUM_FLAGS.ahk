#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ne-netfw-fw_dynamic_keyword_address_enum_flags
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_AUTO_RESOLVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_NON_AUTO_RESOLVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_ALL => 3
}
