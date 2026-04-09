#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IKEEXT_CREDENTIAL1.ahk
#Include .\IKEEXT_AUTHENTICATION_METHOD_TYPE.ahk
#Include .\IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE.ahk
#Include .\IKEEXT_PRESHARED_KEY_AUTHENTICATION1.ahk
#Include .\IKEEXT_CERTIFICATE_CREDENTIAL1.ahk
#Include .\IKEEXT_NAME_CREDENTIAL0.ahk

/**
 * Is used to store credential information used for the authentication. (IKEEXT_CREDENTIAL_PAIR1)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_credential_pair1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IKEEXT_CREDENTIAL_PAIR1 extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * Local credentials used for authentication.
     * 
     * See [IKEEXT_CREDENTIAL1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credential1) for more information.
     * @type {IKEEXT_CREDENTIAL1}
     */
    localCredentials {
        get {
            if(!this.HasProp("__localCredentials"))
                this.__localCredentials := IKEEXT_CREDENTIAL1(0, this)
            return this.__localCredentials
        }
    }

    /**
     * Peer credentials used for authentication.
     * 
     * See [IKEEXT_CREDENTIAL1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credential1) for more information.
     * @type {IKEEXT_CREDENTIAL1}
     */
    peerCredentials {
        get {
            if(!this.HasProp("__peerCredentials"))
                this.__peerCredentials := IKEEXT_CREDENTIAL1(16, this)
            return this.__peerCredentials
        }
    }
}
