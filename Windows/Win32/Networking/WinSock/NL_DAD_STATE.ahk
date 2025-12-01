#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The IP_DAD_STATE enumeration specifies information about the duplicate address detection (DAD) state for an IPv4 or IPv6 address.
 * @remarks
 * The <b>IP_DAD_STATE</b> enumeration is used in the <b>DadState</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_unicast_address_lh">IP_ADAPTER_UNICAST_ADDRESS</a>  structure.
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>IP_DAD_STATE</b> enumeration is defined in the <i>Nldef.h</i> header file which is automatically included by the <i>Iptypes.h</i> header file. The  <i>Nldef.h</i> and <i>Iptypes.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/nldef/ne-nldef-nl_dad_state
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NL_DAD_STATE extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NldsInvalid => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NldsTentative => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NldsDuplicate => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NldsDeprecated => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NldsPreferred => 4

    /**
     * The DAD state is invalid.
     * @type {Integer (Int32)}
     */
    static IpDadStateInvalid => 0

    /**
     * The DAD state is tentative.
     * @type {Integer (Int32)}
     */
    static IpDadStateTentative => 1

    /**
     * A duplicate IP address has been detected.
     * @type {Integer (Int32)}
     */
    static IpDadStateDuplicate => 2

    /**
     * The IP address has been deprecated.
     * @type {Integer (Int32)}
     */
    static IpDadStateDeprecated => 3

    /**
     * The IP address is the preferred address.
     * @type {Integer (Int32)}
     */
    static IpDadStatePreferred => 4
}
