#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the origin of the dynamic keyword address object in an [**FW_DYNAMIC_KEYWORD_ADDRESS_DATA0**](/windows/win32/api/netfw/ns-netfw-fw_dynamic_keyword_address_data0).
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ne-netfw-fw_dynamic_keyword_origin_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
class FW_DYNAMIC_KEYWORD_ORIGIN_TYPE extends Win32Enum {

    /**
     * Specifies an invalid object.
     * Native name: FW_DYNAMIC_KEYWORD_ORIGIN_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 0

    /**
     * Specifies a locally created object.
     * Native name: FW_DYNAMIC_KEYWORD_ORIGIN_LOCAL
     * @type {Integer (Int32)}
     */
    static LOCAL => 1

    /**
     * Specifies an MDM managed object.
     * Native name: FW_DYNAMIC_KEYWORD_ORIGIN_MDM
     * @type {Integer (Int32)}
     */
    static MDM => 2
}
