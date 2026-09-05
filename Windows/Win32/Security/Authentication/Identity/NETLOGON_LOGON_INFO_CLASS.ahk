#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class NETLOGON_LOGON_INFO_CLASS extends Win32Enum {

    /**
     * Native name: NetlogonInteractiveInformation
     * @type {Integer (Int32)}
     */
    static InteractiveInformation => 1

    /**
     * Native name: NetlogonNetworkInformation
     * @type {Integer (Int32)}
     */
    static NetworkInformation => 2

    /**
     * Native name: NetlogonServiceInformation
     * @type {Integer (Int32)}
     */
    static ServiceInformation => 3

    /**
     * Native name: NetlogonGenericInformation
     * @type {Integer (Int32)}
     */
    static GenericInformation => 4

    /**
     * Native name: NetlogonInteractiveTransitiveInformation
     * @type {Integer (Int32)}
     */
    static InteractiveTransitiveInformation => 5

    /**
     * Native name: NetlogonNetworkTransitiveInformation
     * @type {Integer (Int32)}
     */
    static NetworkTransitiveInformation => 6

    /**
     * Native name: NetlogonServiceTransitiveInformation
     * @type {Integer (Int32)}
     */
    static ServiceTransitiveInformation => 7

    /**
     * Native name: NetlogonTicketLogonInformation
     * @type {Integer (Int32)}
     */
    static TicketLogonInformation => 8
}
