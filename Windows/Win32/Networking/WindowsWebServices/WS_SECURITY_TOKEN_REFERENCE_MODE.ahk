#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * With message and mixed-mode security bindings, the mechanism to use to refer to a security token from signatures, encrypted items and derived tokens.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_security_token_reference_mode
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_SECURITY_TOKEN_REFERENCE_MODE extends Win32Enum {

    /**
     * The id of the serialized security token is used to refer to it.  This
     * reference mechanism can be used only when the security token is
     * serialized in the same message as the item (such as a signature) that
     * needs to refer to the security token.
     * Native name: WS_SECURITY_TOKEN_REFERENCE_MODE_LOCAL_ID
     * @type {Integer (Int32)}
     */
    static LOCAL_ID => 1

    /**
     * An opaque XML buffer that is used as a token reference (for example, as in a custom token).
     * Native name: WS_SECURITY_TOKEN_REFERENCE_MODE_XML_BUFFER
     * @type {Integer (Int32)}
     */
    static XML_BUFFER => 2

    /**
     * The thumbprint of a certificate is used to refer to it.
     * Native name: WS_SECURITY_TOKEN_REFERENCE_MODE_CERT_THUMBPRINT
     * @type {Integer (Int32)}
     */
    static CERT_THUMBPRINT => 3

    /**
     * The context-id is used to refer to a security context token.
     * Native name: WS_SECURITY_TOKEN_REFERENCE_MODE_SECURITY_CONTEXT_ID
     * @type {Integer (Int32)}
     */
    static SECURITY_CONTEXT_ID => 4

    /**
     * The SAML assertion ID is used to refer to the SAML token.
     * Native name: WS_SECURITY_TOKEN_REFERENCE_MODE_SAML_ASSERTION_ID
     * @type {Integer (Int32)}
     */
    static SAML_ASSERTION_ID => 5
}
