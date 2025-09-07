#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\EapUsernamePasswordCredential.ahk
#Include .\EapCertificateCredential.ahk
#Include .\EapSimCredential.ahk
#Include .\EapCredentialTypeData.ahk

/**
 * Contains information about the credentials type and the appropriate credentials. This is passed as an input to the EapPeerGetConfigBlobAndUserBlob API.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eapcredential
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EapCredential extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ne-eaptypes-eapcredentialtype">EapCredentialType</a> for the  credentials passed in the <i>credentials</i> parameter.
     * @type {Integer}
     */
    credType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

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
     * @type {EapCredentialTypeData}
     */
    credData{
        get {
            if(!this.HasProp("__credData"))
                this.__credData := EapCredentialTypeData(this.ptr + 8)
            return this.__credData
        }
    }
}
