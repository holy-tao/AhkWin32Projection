#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify the kind(s) of objects to include in an enumeration operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ne-netfw-fw_dynamic_keyword_address_enum_flags
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS{

    /**
     * Specifies that enumeration should include all objects that have the [FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE](ne-netfw-fw_dynamic_keyword_address_flags.md) flag set.
     * @type {Integer (Int32)}
     */
    static FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_AUTO_RESOLVE => 1

    /**
     * Specifies that enumeration should include all objects that have the [FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE](ne-netfw-fw_dynamic_keyword_address_flags.md) flag *not* set.
     * @type {Integer (Int32)}
     */
    static FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_NON_AUTO_RESOLVE => 2

    /**
     * Specifies that enumeration should include *all* objects.
     * @type {Integer (Int32)}
     */
    static FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_ALL => 3
}
