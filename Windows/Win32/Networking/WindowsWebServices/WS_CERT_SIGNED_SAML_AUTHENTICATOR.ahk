#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SAML_AUTHENTICATOR.ahk

/**
 * The type for specifying a SAML token authenticator based on an array of expected issuer certificates.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_cert_signed_saml_authenticator
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CERT_SIGNED_SAML_AUTHENTICATOR extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The base type from which this type and all other SAML authenticator
     * types derive.
     * @type {WS_SAML_AUTHENTICATOR}
     */
    authenticator{
        get {
            if(!this.HasProp("__authenticator"))
                this.__authenticator := WS_SAML_AUTHENTICATOR(this.ptr + 0)
            return this.__authenticator
        }
    }

    /**
     * The array of acceptable SAML issuers, identified by their X.509
     * certificates.  This field is required.
     *                 
     * 
     * The certificate handles are duplicated and the copies are kept for
     * internal use.  The application continues to own the certificate
     * handles supplied here and is responsible for freeing them anytime
     * after the listener creation call that uses this structure returns.
     * @type {Pointer<CERT_CONTEXT>}
     */
    trustedIssuerCerts {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The count of X.509 certificates specified in trustedIssuerCerts.
     * @type {Integer}
     */
    trustedIssuerCertCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The certificate for decrypting incoming SAML tokens.
     *                 
     * 
     * The certificate handle is duplicated and the copy is kept for internal
     * use.  The application continues to own the certificate handle supplied
     * here and is responsible for freeing it anytime after the listener
     * creation call that uses this structure returns.
     * @type {Pointer<CERT_CONTEXT>}
     */
    decryptionCert {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * An optional callback to enable the application to additional
     * validation on the SAML assertion if the signature validation passes.
     * @type {Pointer<WS_VALIDATE_SAML_CALLBACK>}
     */
    samlValidator {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The state to be passed back when invoking the samlValidator callback.
     * @type {Pointer<Void>}
     */
    samlValidatorCallbackState {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
