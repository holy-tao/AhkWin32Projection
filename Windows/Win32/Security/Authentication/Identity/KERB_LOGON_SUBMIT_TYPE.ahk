#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type of logon being requested.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-kerb_logon_submit_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_LOGON_SUBMIT_TYPE extends Win32Enum{

    /**
     * Perform an interactive logon.
     * @type {Integer (Int32)}
     */
    static KerbInteractiveLogon => 2

    /**
     * Logon using a smart card.
     * @type {Integer (Int32)}
     */
    static KerbSmartCardLogon => 6

    /**
     * Unlock a workstation.
     * @type {Integer (Int32)}
     */
    static KerbWorkstationUnlockLogon => 7

    /**
     * Unlock a workstation using a smart card.
     * @type {Integer (Int32)}
     */
    static KerbSmartCardUnlockLogon => 8

    /**
     * Logon using a proxy server.
     * @type {Integer (Int32)}
     */
    static KerbProxyLogon => 9

    /**
     * Logon using a valid <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Kerberos</a> ticket as a credential.
     * @type {Integer (Int32)}
     */
    static KerbTicketLogon => 10

    /**
     * Unlock a workstation by using a Kerberos ticket.
     * @type {Integer (Int32)}
     */
    static KerbTicketUnlockLogon => 11

    /**
     * Perform a service for user logon.
     * @type {Integer (Int32)}
     */
    static KerbS4ULogon => 12

    /**
     * Logon interactively using a certificate stored on a smart card.
     * @type {Integer (Int32)}
     */
    static KerbCertificateLogon => 13

    /**
     * Perform a service for user logon using a certificate stored on a smart card.
     * @type {Integer (Int32)}
     */
    static KerbCertificateS4ULogon => 14

    /**
     * Unlock a workstation using a certificate stored on a smart card.
     * @type {Integer (Int32)}
     */
    static KerbCertificateUnlockLogon => 15

    /**
     * 
     * @type {Integer (Int32)}
     */
    static KerbNoElevationLogon => 83

    /**
     * 
     * @type {Integer (Int32)}
     */
    static KerbLuidLogon => 84
}
