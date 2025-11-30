#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of possible EAP credentials that can be passed to the EapPeerGetConfigBlobAndUserBlob function.
 * @see https://docs.microsoft.com/windows/win32/api//eaptypes/ne-eaptypes-eapcredentialtype
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EapCredentialType extends Win32Enum{

    /**
     * The EAP method has no credential passed to it. The method must attempt a machine authentication.
     * @type {Integer (Int32)}
     */
    static EAP_EMPTY_CREDENTIAL => 0

    /**
     * The EAP method uses a username and password for authentication. The credentials are passed using the <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eapusernamepasswordcredential">EapUsernamePasswordCredential</a> structure.
     * @type {Integer (Int32)}
     */
    static EAP_USERNAME_PASSWORD_CREDENTIAL => 1

    /**
     * The EAP method uses the logged-on user credentials for authentication.
     * @type {Integer (Int32)}
     */
    static EAP_WINLOGON_CREDENTIAL => 2

    /**
     * The EAP method uses a certificate present on the system for authentication. The credential is passed as an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eapcertificatecredential">EapCertificateCredential</a> structure.
     * @type {Integer (Int32)}
     */
    static EAP_CERTIFICATE_CREDENTIAL => 3

    /**
     * The EAP method uses a SIM for authentication. This is passed as an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eapsimcredential">EapSimCredential</a> structure.
     * @type {Integer (Int32)}
     */
    static EAP_SIM_CREDENTIAL => 4
}
