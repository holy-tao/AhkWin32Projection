#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class NETLOGON_LOGON_INFO_CLASS{

    /**
     * @type {Integer (Int32)}
     */
    static NetlogonInteractiveInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static NetlogonNetworkInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static NetlogonServiceInformation => 3

    /**
     * @type {Integer (Int32)}
     */
    static NetlogonGenericInformation => 4

    /**
     * @type {Integer (Int32)}
     */
    static NetlogonInteractiveTransitiveInformation => 5

    /**
     * @type {Integer (Int32)}
     */
    static NetlogonNetworkTransitiveInformation => 6

    /**
     * @type {Integer (Int32)}
     */
    static NetlogonServiceTransitiveInformation => 7

    /**
     * @type {Integer (Int32)}
     */
    static NetlogonTicketLogonInformation => 8
}
