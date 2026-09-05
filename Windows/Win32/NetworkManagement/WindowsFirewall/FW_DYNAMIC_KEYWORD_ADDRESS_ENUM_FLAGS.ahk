#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the kind(s) of objects to include in an enumeration operation.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ne-netfw-fw_dynamic_keyword_address_enum_flags
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
class FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS extends Win32BitflagEnum {

    /**
     * Specifies that enumeration should include all objects that have the [FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE](ne-netfw-fw_dynamic_keyword_address_flags.md) flag set.
     * Native name: FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_AUTO_RESOLVE
     * @type {Integer (Int32)}
     */
    static AUTO_RESOLVE => 1

    /**
     * Specifies that enumeration should include all objects that have the [FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE](ne-netfw-fw_dynamic_keyword_address_flags.md) flag *not* set.
     * Native name: FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_NON_AUTO_RESOLVE
     * @type {Integer (Int32)}
     */
    static NON_AUTO_RESOLVE => 2

    /**
     * Specifies that enumeration should include *all* objects.
     * Native name: FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 3
}
