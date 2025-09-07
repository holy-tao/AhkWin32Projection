#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify how IP addresses are to be resolved.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ne-netfw-fw_dynamic_keyword_address_flags
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS{

    /**
     * Specifies that the IP addresses will be auto-resolved and populated by another component outside the firewall service.
     * @type {Integer (Int32)}
     */
    static FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE => 1
}
