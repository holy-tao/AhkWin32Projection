#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\Cryptography\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\WS_SAML_AUTHENTICATOR.ahk" { WS_SAML_AUTHENTICATOR }
#Import ".\WS_SAML_AUTHENTICATOR_TYPE.ahk" { WS_SAML_AUTHENTICATOR_TYPE }

/**
 * The type for specifying a SAML token authenticator based on an array of expected issuer certificates.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_cert_signed_saml_authenticator
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CERT_SIGNED_SAML_AUTHENTICATOR {
    #StructPack 8

    /**
     * The base type from which this type and all other SAML authenticator
     * types derive.
     */
    authenticator : WS_SAML_AUTHENTICATOR

    /**
     * The array of acceptable SAML issuers, identified by their X.509
     * certificates.  This field is required.
     *                 
     * 
     * The certificate handles are duplicated and the copies are kept for
     * internal use.  The application continues to own the certificate
     * handles supplied here and is responsible for freeing them anytime
     * after the listener creation call that uses this structure returns.
     */
    trustedIssuerCerts : IntPtr

    /**
     * The count of X.509 certificates specified in trustedIssuerCerts.
     */
    trustedIssuerCertCount : UInt32

    /**
     * The certificate for decrypting incoming SAML tokens.
     *                 
     * 
     * The certificate handle is duplicated and the copy is kept for internal
     * use.  The application continues to own the certificate handle supplied
     * here and is responsible for freeing it anytime after the listener
     * creation call that uses this structure returns.
     */
    decryptionCert : CERT_CONTEXT.Ptr

    /**
     * An optional callback to enable the application to additional
     * validation on the SAML assertion if the signature validation passes.
     */
    samlValidator : IntPtr

    /**
     * The state to be passed back when invoking the samlValidator callback.
     */
    samlValidatorCallbackState : IntPtr

}
