#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_USERNAME_CREDENTIAL.ahk" { WS_USERNAME_CREDENTIAL }
#Import ".\WS_SECURITY_BINDING_PROPERTIES.ahk" { WS_SECURITY_BINDING_PROPERTIES }
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }

/**
 * The security binding template for specifying the use of an application supplied username / password pair as a direct (i.e., one-shot) security token.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_username_message_security_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_USERNAME_MESSAGE_SECURITY_BINDING_TEMPLATE {
    #StructPack 8

    /**
     * Application provided security binding properties that cannot be represented in policy.
     */
    securityBindingProperties : WS_SECURITY_BINDING_PROPERTIES

    /**
     * The username credential to be used with this security binding.  This
     *           needs to be specified when this security binding is used on the
     *           client.
     */
    clientCredential : WS_USERNAME_CREDENTIAL.Ptr

    /**
     * The validator to be used to check received username/password pairs.
     *           This needs to be specified when this security binding is used on the
     *           service.
     */
    passwordValidator : IntPtr

    /**
     * The optional state to be passed in as an argument when the username validator is invoked.
     */
    passwordValidatorCallbackState : IntPtr

}
