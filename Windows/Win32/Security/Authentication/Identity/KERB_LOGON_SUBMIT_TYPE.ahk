#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type of logon being requested.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-kerb_logon_submit_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class KERB_LOGON_SUBMIT_TYPE extends Win32Enum {

    /**
     * Perform an interactive logon.
     * Native name: KerbInteractiveLogon
     * @type {Integer (Int32)}
     */
    static InteractiveLogon => 2

    /**
     * Logon using a smart card.
     * Native name: KerbSmartCardLogon
     * @type {Integer (Int32)}
     */
    static SmartCardLogon => 6

    /**
     * Unlock a workstation.
     * Native name: KerbWorkstationUnlockLogon
     * @type {Integer (Int32)}
     */
    static WorkstationUnlockLogon => 7

    /**
     * Unlock a workstation using a smart card.
     * Native name: KerbSmartCardUnlockLogon
     * @type {Integer (Int32)}
     */
    static SmartCardUnlockLogon => 8

    /**
     * Logon using a proxy server.
     * Native name: KerbProxyLogon
     * @type {Integer (Int32)}
     */
    static ProxyLogon => 9

    /**
     * Logon using a valid <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Kerberos</a> ticket as a credential.
     * Native name: KerbTicketLogon
     * @type {Integer (Int32)}
     */
    static TicketLogon => 10

    /**
     * Unlock a workstation by using a Kerberos ticket.
     * Native name: KerbTicketUnlockLogon
     * @type {Integer (Int32)}
     */
    static TicketUnlockLogon => 11

    /**
     * Perform a service for user logon.
     * @type {Integer (Int32)}
     */
    static KerbS4ULogon => 12

    /**
     * Logon interactively using a certificate stored on a smart card.
     * Native name: KerbCertificateLogon
     * @type {Integer (Int32)}
     */
    static CertificateLogon => 13

    /**
     * Perform a service for user logon using a certificate stored on a smart card.
     * Native name: KerbCertificateS4ULogon
     * @type {Integer (Int32)}
     */
    static CertificateS4ULogon => 14

    /**
     * Unlock a workstation using a certificate stored on a smart card.
     * Native name: KerbCertificateUnlockLogon
     * @type {Integer (Int32)}
     */
    static CertificateUnlockLogon => 15

    /**
     * Native name: KerbNoElevationLogon
     * @type {Integer (Int32)}
     */
    static NoElevationLogon => 83

    /**
     * Native name: KerbLuidLogon
     * @type {Integer (Int32)}
     */
    static LuidLogon => 84
}
