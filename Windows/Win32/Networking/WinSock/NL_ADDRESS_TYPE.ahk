#Requires AutoHotkey v2.0.0 64-bit

/**
 * The NL_ADDRESS_TYPE enumeration type specifies the IP address type of the network layer.
 * @see https://docs.microsoft.com/windows/win32/api//nldef/ne-nldef-nl_address_type
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NL_ADDRESS_TYPE{

    /**
     * The unspecified IP address. For example, for IPv4, this address is 0.0.0.0.
     * @type {Integer (Int32)}
     */
    static NlatUnspecified => 0

    /**
     * Any IPv4 or IPv6 unicast address.
     * @type {Integer (Int32)}
     */
    static NlatUnicast => 1

    /**
     * An IPv6 anycast address.
     * @type {Integer (Int32)}
     */
    static NlatAnycast => 2

    /**
     * An IPv4 or IPv6 multicast address.
     * @type {Integer (Int32)}
     */
    static NlatMulticast => 3

    /**
     * An IPv4 broadcast address.
     * @type {Integer (Int32)}
     */
    static NlatBroadcast => 4

    /**
     * An invalid IP address.
     * @type {Integer (Int32)}
     */
    static NlatInvalid => 5
}
