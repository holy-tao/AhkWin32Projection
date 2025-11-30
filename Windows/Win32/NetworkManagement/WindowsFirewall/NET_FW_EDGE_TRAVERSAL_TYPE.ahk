#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The conditions under which edge traversal traffic is allowed.
 * @remarks
 * 
 *     In order for Windows Firewall to dynamically allow edge traversal traffic, the application must use the  <a href="https://docs.microsoft.com/windows/desktop/WinSock/ipv6-protection-level">IPV6_PROTECTION_LEVEL</a> socket option on the listening socket
 *         and set it to <b>PROTECTION_LEVEL_UNRESTRICTED</b> only in the cases where edge traversal traffic should be allowed. The Windows Firewall rule added for the application must then set 
 *             its edge traversal option  to <b>NET_FW_EDGE_TRAVERSAL_TYPE_DEFER_TO_APP</b> or <b>NET_FW_EDGE_TRAVERSAL_TYPE_DEFER_TO_USER</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//icftypes/ne-icftypes-net_fw_edge_traversal_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class NET_FW_EDGE_TRAVERSAL_TYPE extends Win32Enum{

    /**
     * Edge traversal traffic is always blocked.
     * 
     * This is the same as setting the EdgeTraversal property using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> to <b>VARIANT_FALSE</b>.
     * @type {Integer (Int32)}
     */
    static NET_FW_EDGE_TRAVERSAL_TYPE_DENY => 0

    /**
     * Edge traversal traffic is always allowed.
     * 
     * This is the same as setting the EdgeTraversal property using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> to <b>VARIANT_TRUE</b>.
     * @type {Integer (Int32)}
     */
    static NET_FW_EDGE_TRAVERSAL_TYPE_ALLOW => 1

    /**
     * Edge traversal traffic is allowed when the application sets the <a href="https://docs.microsoft.com/windows/desktop/WinSock/ipv6-protection-level">IPV6_PROTECTION_LEVEL</a> socket option to <b>PROTECTION_LEVEL_UNRESTRICTED</b>. Otherwise, it is blocked.
     * @type {Integer (Int32)}
     */
    static NET_FW_EDGE_TRAVERSAL_TYPE_DEFER_TO_APP => 2

    /**
     * The user is prompted whether to allow edge traversal traffic when the application sets the IPV6_PROTECTION_LEVEL socket option to <b>PROTECTION_LEVEL_UNRESTRICTED</b>. If the user chooses to allow  edge traversal traffic, the rule is modified to defer to the application's settings.
     * 
     * If the application has not set the IPV6_PROTECTION_LEVEL socket option to <b>PROTECTION_LEVEL_UNRESTRICTED</b>, edge traversal traffic is blocked.
     * 
     * In order to use this option, the firewall rule must have both the application path and protocol scopes specified. This option cannot be used if port(s) are defined.
     * @type {Integer (Int32)}
     */
    static NET_FW_EDGE_TRAVERSAL_TYPE_DEFER_TO_USER => 3
}
