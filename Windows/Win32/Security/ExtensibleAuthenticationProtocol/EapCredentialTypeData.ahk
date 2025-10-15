#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\EapUsernamePasswordCredential.ahk
#Include .\EapCertificateCredential.ahk
#Include .\EapSimCredential.ahk

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EapCredentialTypeData extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {EapUsernamePasswordCredential}
     */
    username_password{
        get {
            if(!this.HasProp("__username_password"))
                this.__username_password := EapUsernamePasswordCredential(this.ptr + 0)
            return this.__username_password
        }
    }

    /**
     * @type {EapCertificateCredential}
     */
    certificate{
        get {
            if(!this.HasProp("__certificate"))
                this.__certificate := EapCertificateCredential(this.ptr + 0)
            return this.__certificate
        }
    }

    /**
     * @type {EapSimCredential}
     */
    sim{
        get {
            if(!this.HasProp("__sim"))
                this.__sim := EapSimCredential(this.ptr + 0)
            return this.__sim
        }
    }
}
