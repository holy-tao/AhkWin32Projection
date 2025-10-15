#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Provides information about a provider certificate.
 * @see https://docs.microsoft.com/windows/win32/api//wintrust/ns-wintrust-crypt_provider_cert
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class CRYPT_PROVIDER_CERT extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the certificate context.
     * @type {Pointer<CERT_CONTEXT>}
     */
    pCert {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Boolean value that indicates whether the certificate is a commercial certificate.
     * @type {BOOL}
     */
    fCommercial{
        get {
            if(!this.HasProp("__fCommercial"))
                this.__fCommercial := BOOL(this.ptr + 16)
            return this.__fCommercial
        }
    }

    /**
     * Boolean value that indicates whether the certificate is a trusted root certificate.
     * @type {BOOL}
     */
    fTrustedRoot{
        get {
            if(!this.HasProp("__fTrustedRoot"))
                this.__fTrustedRoot := BOOL(this.ptr + 20)
            return this.__fTrustedRoot
        }
    }

    /**
     * Boolean value that indicates whether the certificate is self-signed.
     * @type {BOOL}
     */
    fSelfSigned{
        get {
            if(!this.HasProp("__fSelfSigned"))
                this.__fSelfSigned := BOOL(this.ptr + 24)
            return this.__fSelfSigned
        }
    }

    /**
     * Boolean value that indicates whether the certificate is a test certificate.
     * @type {BOOL}
     */
    fTestCert{
        get {
            if(!this.HasProp("__fTestCert"))
                this.__fTestCert := BOOL(this.ptr + 28)
            return this.__fTestCert
        }
    }

    /**
     * Value that specifies the revocation reason, if applicable.
     * @type {Integer}
     */
    dwRevokedReason {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Bitwise combination of zero or more of the following confidence values.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CONFIDENCE_SIG"></a><a id="cert_confidence_sig"></a><dl>
     * <dt><b>CERT_CONFIDENCE_SIG</b></dt>
     * <dt>             0x10000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The signature of the certificate is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CONFIDENCE_TIME"></a><a id="cert_confidence_time"></a><dl>
     * <dt><b>CERT_CONFIDENCE_TIME</b></dt>
     * <dt>            0x01000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The time of the certificate issuer is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CONFIDENCE_TIMENEST"></a><a id="cert_confidence_timenest"></a><dl>
     * <dt><b>CERT_CONFIDENCE_TIMENEST</b></dt>
     * <dt>0x00100000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The time of the certificate is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CONFIDENCE_AUTHIDEXT"></a><a id="cert_confidence_authidext"></a><dl>
     * <dt><b>CERT_CONFIDENCE_AUTHIDEXT</b></dt>
     * <dt>0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The authority ID extension is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CONFIDENCE_HYGIENE"></a><a id="cert_confidence_hygiene"></a><dl>
     * <dt><b>CERT_CONFIDENCE_HYGIENE</b></dt>
     * <dt>0x00001000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At a minimum, the signature of the certificate and authority ID extension are valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CONFIDENCE_HIGHEST"></a><a id="cert_confidence_highest"></a><dl>
     * <dt><b>CERT_CONFIDENCE_HIGHEST</b></dt>
     * <dt>0x11111000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combination of all of the other confidence values.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwConfidence {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * A pointer to a <b>DWORD</b> variable that contains the error value for this certificate, if applicable.
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_context">CTL_CONTEXT</a> that represents the certificate trust list (CTL).
     * @type {Pointer<CTL_CONTEXT>}
     */
    pTrustListContext {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Boolean value that specifies whether the certificate is a trust list signer certificate.
     * @type {BOOL}
     */
    fTrustListSignerCert{
        get {
            if(!this.HasProp("__fTrustListSignerCert"))
                this.__fTrustListSignerCert := BOOL(this.ptr + 56)
            return this.__fTrustListSignerCert
        }
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_context">CTL_CONTEXT</a> that represents a CTL that contains a self-signed certificate, if applicable.
     * @type {Pointer<CTL_CONTEXT>}
     */
    pCtlContext {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A pointer to a <b>DWORD</b> variable that contains the error value for a CTL that contains a self-signed certificate, if applicable.
     * @type {Integer}
     */
    dwCtlError {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Boolean value that indicates whether the certificate trust is cyclical.
     * @type {BOOL}
     */
    fIsCyclic{
        get {
            if(!this.HasProp("__fIsCyclic"))
                this.__fIsCyclic := BOOL(this.ptr + 76)
            return this.__fIsCyclic
        }
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_element">CERT_CHAIN_ELEMENT</a> that represents the status of the certificate within a chain.
     * @type {Pointer<CERT_CHAIN_ELEMENT>}
     */
    pChainElement {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
