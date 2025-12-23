#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NL_LINK_LOCAL_ADDRESS_BEHAVIOR enumeration type defines the link local address behavior.
 * @see https://learn.microsoft.com/windows/win32/api/nldef/ne-nldef-nl_link_local_address_behavior
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NL_LINK_LOCAL_ADDRESS_BEHAVIOR extends Win32Enum{

    /**
     * A link local IP address should never be used.
     * @type {Integer (Int32)}
     */
    static LinkLocalAlwaysOff => 0

    /**
     * A link local IP address should be used only if no other address is available. This setting is the
     *      default setting for an IPv4 interface.
     * @type {Integer (Int32)}
     */
    static LinkLocalDelayed => 1

    /**
     * A link local IP address should always be used. This setting is the default setting for an IPv6
     *      interface.
     * @type {Integer (Int32)}
     */
    static LinkLocalAlwaysOn => 2

    /**
     * When the properties of an IP interface are being set, the value for link local address behavior
     *      should be unchanged.
     * @type {Integer (Int32)}
     */
    static LinkLocalUnchanged => -1
}
