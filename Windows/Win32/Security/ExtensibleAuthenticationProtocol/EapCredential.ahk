#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EapCredentialType.ahk" { EapCredentialType }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\EapSimCredential.ahk" { EapSimCredential }
#Import ".\EapCertificateCredential.ahk" { EapCertificateCredential }
#Import ".\EapCredentialTypeData.ahk" { EapCredentialTypeData }
#Import ".\EapUsernamePasswordCredential.ahk" { EapUsernamePasswordCredential }

/**
 * Contains information about the credentials type and the appropriate credentials. This is passed as an input to the EapPeerGetConfigBlobAndUserBlob API.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eapcredential
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EapCredential {
    #StructPack 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ne-eaptypes-eapcredentialtype">EapCredentialType</a> for the  credentials passed in the <i>credentials</i> parameter.
     */
    credType : EapCredentialType

    /**
     * Structure that holds the pointer to the credential data. 
     * 
     * If <b>credType</b> is set to <b>EAP_EMPTY_CREDENTIAL</b>, specify a NULL value for credentials.
     * 
     * If <b>credType</b> is set to  <b>EAP_USERNAME_PASSWORD_CREDENTIAL</b>, use an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eapusernamepasswordcredential">EapUsernamePasswordCredential</a> structure to specify the username and password to use for the credentials. 
     * 
     * If <b>credType</b> is set to <b>EAP_WINLOGON_CREDENTIAL</b>, specify a NULL value for credentials. 
     * 
     * If <b>credType</b> is set to <b>EAP_CERTIFICATE_CREDENTIAL</b>, use an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eapcertificatecredential">EapCertificateCredential</a> structure for credentials to specify  the certificate hash and a password (in case the certificate is password protected). 
     * 
     * If <b>credType</b> is set to <b>EAP_SIM_CREDENTIAL</b>, use an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eapsimcredential">EapSimCredential</a> structure for credentials to specify the  ICC-ID of the selected SIM.
     */
    credData : EapCredentialTypeData

}
