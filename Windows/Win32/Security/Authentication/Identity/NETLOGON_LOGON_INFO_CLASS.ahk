#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct NETLOGON_LOGON_INFO_CLASS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
