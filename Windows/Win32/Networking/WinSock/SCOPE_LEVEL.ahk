#Requires AutoHotkey v2.0.0 64-bit

/**
 * The SCOPE_LEVEL enumeration is used with the IP_ADAPTER_ADDRESSES structure to identify scope levels for IPv6 addresses.
 * @remarks
 * The <b>SCOPE_LEVEL</b> enumeration is used in the <b>ZoneIndices</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_addresses_lh">IP_ADAPTER_ADDRESSES</a>  structure.
  * 
  * On Windows Vista and later as well as on the Microsoft Windows Software Development Kit (SDK), the organization of header files has changed and the <b>SCOPE_LEVEL</b> enumeration type is defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ws2def/ne-ws2def-scope_level
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SCOPE_LEVEL{

    /**
     * The scope is interface-level.
     * @type {Integer (Int32)}
     */
    static ScopeLevelInterface => 1

    /**
     * The scope is link-level.
     * @type {Integer (Int32)}
     */
    static ScopeLevelLink => 2

    /**
     * The scope is subnet-level.
     * @type {Integer (Int32)}
     */
    static ScopeLevelSubnet => 3

    /**
     * The scope is admin-level.
     * @type {Integer (Int32)}
     */
    static ScopeLevelAdmin => 4

    /**
     * The scope is site-level.
     * @type {Integer (Int32)}
     */
    static ScopeLevelSite => 5

    /**
     * The scope is organization-level.
     * @type {Integer (Int32)}
     */
    static ScopeLevelOrganization => 8

    /**
     * The scope is global.
     * @type {Integer (Int32)}
     */
    static ScopeLevelGlobal => 14

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ScopeLevelCount => 16
}
