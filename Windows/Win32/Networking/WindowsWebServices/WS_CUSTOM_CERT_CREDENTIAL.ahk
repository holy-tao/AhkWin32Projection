#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_CERT_CREDENTIAL.ahk

/**
 * The type for specifying a certificate credential that is to be supplied by a callback to the application.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_custom_cert_credential
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CUSTOM_CERT_CREDENTIAL extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The base type from which this type and all other certificate credential types derive.
     * @type {WS_CERT_CREDENTIAL}
     */
    credential{
        get {
            if(!this.HasProp("__credential"))
                this.__credential := WS_CERT_CREDENTIAL(this.ptr + 0)
            return this.__credential
        }
    }

    /**
     * The Callback to get the certificate.
     * @type {Pointer<WS_GET_CERT_CALLBACK>}
     */
    getCertCallback {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The state to be passed when invoking the callback.
     * @type {Pointer<Void>}
     */
    getCertCallbackState {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Pointer<WS_CERT_ISSUER_LIST_NOTIFICATION_CALLBACK>}
     */
    certIssuerListNotificationCallback {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * 
     * @type {Pointer<Void>}
     */
    certIssuerListNotificationCallbackState {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
