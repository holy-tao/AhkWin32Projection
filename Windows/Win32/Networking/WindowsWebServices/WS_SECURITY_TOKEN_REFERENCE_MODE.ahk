#Requires AutoHotkey v2.0.0 64-bit

/**
 * With message and mixed-mode security bindings, the mechanism to use to refer to a security token from signatures, encrypted items and derived tokens.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_security_token_reference_mode
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_TOKEN_REFERENCE_MODE{

    /**
     * The id of the serialized security token is used to refer to it.  This
 * reference mechanism can be used only when the security token is
 * serialized in the same message as the item (such as a signature) that
 * needs to refer to the security token.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_TOKEN_REFERENCE_MODE_LOCAL_ID => 1

    /**
     * An opaque XML buffer that is used as a token reference (for example, as in a custom token).
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_TOKEN_REFERENCE_MODE_XML_BUFFER => 2

    /**
     * The thumbprint of a certificate is used to refer to it.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_TOKEN_REFERENCE_MODE_CERT_THUMBPRINT => 3

    /**
     * The context-id is used to refer to a security context token.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_TOKEN_REFERENCE_MODE_SECURITY_CONTEXT_ID => 4

    /**
     * The SAML assertion ID is used to refer to the SAML token.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_TOKEN_REFERENCE_MODE_SAML_ASSERTION_ID => 5
}
