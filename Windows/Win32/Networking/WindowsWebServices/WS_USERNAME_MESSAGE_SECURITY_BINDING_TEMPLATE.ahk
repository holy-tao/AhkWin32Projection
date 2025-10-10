#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING_PROPERTIES.ahk

/**
 * The security binding template for specifying the use of an application supplied username / password pair as a direct (i.e., one-shot) security token.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_username_message_security_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_USERNAME_MESSAGE_SECURITY_BINDING_TEMPLATE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Application provided security binding properties that cannot be represented in policy.
     * @type {WS_SECURITY_BINDING_PROPERTIES}
     */
    securityBindingProperties{
        get {
            if(!this.HasProp("__securityBindingProperties"))
                this.__securityBindingProperties := WS_SECURITY_BINDING_PROPERTIES(this.ptr + 0)
            return this.__securityBindingProperties
        }
    }

    /**
     * The username credential to be used with this security binding.  This
     *           needs to be specified when this security binding is used on the
     *           client.
     * @type {Pointer<WS_USERNAME_CREDENTIAL>}
     */
    clientCredential {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The validator to be used to check received username/password pairs.
     *           This needs to be specified when this security binding is used on the
     *           service.
     * @type {Pointer<WS_VALIDATE_PASSWORD_CALLBACK>}
     */
    passwordValidator {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The optional state to be passed in as an argument when the username validator is invoked.
     * @type {Pointer<Void>}
     */
    passwordValidatorCallbackState {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
