#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\EapSimCredential.ahk" { EapSimCredential }
#Import ".\EapCertificateCredential.ahk" { EapCertificateCredential }
#Import ".\EapUsernamePasswordCredential.ahk" { EapUsernamePasswordCredential }

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EapCredentialTypeData {
    #StructPack 8

    username_password : EapUsernamePasswordCredential

    static __New() {
        DefineProp(this.Prototype, 'certificate', { type: EapCertificateCredential, offset: 0 })
        DefineProp(this.Prototype, 'sim', { type: EapSimCredential, offset: 0 })
        this.DeleteProp("__New")
    }
}
