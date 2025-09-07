#Requires AutoHotkey v2.0.0 64-bit

/**
 * The PPP_EAP_ACTION enumerated type specifies actions that the Connection Manager should take on behalf of the authentication protocol.
 * @see https://learn.microsoft.com/windows/win32/api/raseapif/ne-raseapif-ppp_eap_action
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class PPP_EAP_ACTION{

    /**
     * Directs the Connection Manager to be passive.
     * @type {Integer (Int32)}
     */
    static EAPACTION_NoAction => 0

    /**
     * Directs the Connection Manager to invoke the authentication provider to authenticate the user.
     * @type {Integer (Int32)}
     */
    static EAPACTION_Authenticate => 1

    /**
     * Directs the Connection Manager Service to end the authentication session. <b>EAPACTION_Done</b> indicates that the <b>dwAuthResultCode</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ppp_eap_output">PPP_EAP_OUTPUT</a> structure is set with an appropriate value.
     * @type {Integer (Int32)}
     */
    static EAPACTION_Done => 2

    /**
     * Directs the Connection Manager to send a message (without a time out), then end the authentication session. <b>EAPACTION_SendAndDone</b> indicates that the <b>dwAuthResultCode</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ppp_eap_output">PPP_EAP_OUTPUT</a> structure is set with an appropriate value.
     * @type {Integer (Int32)}
     */
    static EAPACTION_SendAndDone => 3

    /**
     * Directs the Connection Manager to send a message without setting a time out to wait for a reply.
     * @type {Integer (Int32)}
     */
    static EAPACTION_Send => 4

    /**
     * Directs the Connection Manager to send a message and set a time out to wait for a reply.
     * @type {Integer (Int32)}
     */
    static EAPACTION_SendWithTimeout => 5

    /**
     * Directs the Connection Manager to send a message and set a time out to wait for a reply, but instructs the Connection Manager not to increment the retry counter.
     * @type {Integer (Int32)}
     */
    static EAPACTION_SendWithTimeoutInteractive => 6

    /**
     * Reserved for system use.
     * @type {Integer (Int32)}
     */
    static EAPACTION_IndicateTLV => 7

    /**
     * Reserved for system use.
     * @type {Integer (Int32)}
     */
    static EAPACTION_IndicateIdentity => 8
}
