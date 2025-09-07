#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the type of module information structure passed to calls of the GetOwnerModuleFromXXXEntry family.
 * @see https://learn.microsoft.com/windows/win32/api/iprtrmib/ne-iprtrmib-tcpip_owner_module_info_class
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class TCPIP_OWNER_MODULE_INFO_CLASS{

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> structure is passed to the <b>GetOwnerModuleFromXXXEntry</b> function.
     * @type {Integer (Int32)}
     */
    static TCPIP_OWNER_MODULE_INFO_BASIC => 0
}
