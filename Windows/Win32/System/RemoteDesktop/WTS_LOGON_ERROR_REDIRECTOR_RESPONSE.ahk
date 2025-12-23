#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the preferred response of the protocol to a logon error.
 * @remarks
 * This enumeration is used by the following methods:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollogonerrorredirector-redirectstatus">RedirectStatus</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollogonerrorredirector-redirectmessage">RedirectMessage</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollogonerrorredirector-redirectlogonerror">RedirectLogonError</a>
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ne-wtsdefs-wts_logon_error_redirector_response
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_LOGON_ERROR_REDIRECTOR_RESPONSE extends Win32Enum{

    /**
     * This value is used for safe initialization.
     * @type {Integer (Int32)}
     */
    static WTS_LOGON_ERR_INVALID => 0

    /**
     * Specifies that the client logon was not handled by the redirector and should be handled by the logon user interface.
     * @type {Integer (Int32)}
     */
    static WTS_LOGON_ERR_NOT_HANDLED => 1

    /**
     * Specifies that the client logon was handled by the redirector and that the logon user interface should display itself normally.
     * @type {Integer (Int32)}
     */
    static WTS_LOGON_ERR_HANDLED_SHOW => 2

    /**
     * Specifies that the client logon was handled by the redirector and should not be passed to the next redirector. The logon user interface should not display an error message but should attempt to collect credentials again.
     * @type {Integer (Int32)}
     */
    static WTS_LOGON_ERR_HANDLED_DONT_SHOW => 3

    /**
     * Specifies that the client logon was handled by the redirector and should not be passed to the next redirector.  The logon user interface should not be displayed and should not attempt to collect credentials again.
     * @type {Integer (Int32)}
     */
    static WTS_LOGON_ERR_HANDLED_DONT_SHOW_START_OVER => 4
}
