#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of possible EAP credentials that can be passed to the EapPeerGetConfigBlobAndUserBlob function.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ne-eaptypes-eapcredentialtype
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
class EapCredentialType extends Win32Enum {

    /**
     * The EAP method has no credential passed to it. The method must attempt a machine authentication.
     * Native name: EAP_EMPTY_CREDENTIAL
     * @type {Integer (Int32)}
     */
    static EMPTY_CREDENTIAL => 0

    /**
     * The EAP method uses a username and password for authentication. The credentials are passed using the <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eapusernamepasswordcredential">EapUsernamePasswordCredential</a> structure.
     * Native name: EAP_USERNAME_PASSWORD_CREDENTIAL
     * @type {Integer (Int32)}
     */
    static USERNAME_PASSWORD_CREDENTIAL => 1

    /**
     * The EAP method uses the logged-on user credentials for authentication.
     * Native name: EAP_WINLOGON_CREDENTIAL
     * @type {Integer (Int32)}
     */
    static WINLOGON_CREDENTIAL => 2

    /**
     * The EAP method uses a certificate present on the system for authentication. The credential is passed as an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eapcertificatecredential">EapCertificateCredential</a> structure.
     * Native name: EAP_CERTIFICATE_CREDENTIAL
     * @type {Integer (Int32)}
     */
    static CERTIFICATE_CREDENTIAL => 3

    /**
     * The EAP method uses a SIM for authentication. This is passed as an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eapsimcredential">EapSimCredential</a> structure.
     * Native name: EAP_SIM_CREDENTIAL
     * @type {Integer (Int32)}
     */
    static SIM_CREDENTIAL => 4
}
