#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\Cryptography\HCERTSTORE.ahk

/**
 * Represents the criteria for matching client compact signatures against messages.
 * @remarks
 * 
  * This structure is used in the <b>pConfigData</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_config_param">WSD_CONFIG_PARAM</a> structure when <b>configParamType</b> is set to <b>WSD_SECURITY_COMPACTSIG_VALIDATION</b>.
  * 
  * <b>WSD_SECURITY_SIGNATURE_VALIDATION</b> defines 2 matching mechanisms.  To obtain a match, at least one such mechanism must be satisfied.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdbase/ns-wsdbase-wsd_security_signature_validation
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_SECURITY_SIGNATURE_VALIDATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> stuctures that contain certificates to be matched against a message.  Only one matching certificate is required for validatation.  This parameter can be <b>NULL</b>.
     * @type {Pointer<Pointer<CERT_CONTEXT>>}
     */
    signingCertArray {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The count of certificates in <i>signingMatchArray</i>.
     * @type {Integer}
     */
    dwSigningCertArrayCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A handle to a certificate store that contains certificates to be matched against a message.  Only one matching certificate is required for validatation.  This parameter can be <b>NULL</b>.
     * @type {HCERTSTORE}
     */
    hSigningCertStore{
        get {
            if(!this.HasProp("__hSigningCertStore"))
                this.__hSigningCertStore := HCERTSTORE(16, this)
            return this.__hSigningCertStore
        }
    }

    /**
     * A flag that specifies how unsigned messages are handled.  If set to <b>WSDAPI_COMPACTSIG_ACCEPT_ALL_MESSAGES</b>, then the discovery object will accept unsigned messages, signed-and-verified messages and signed-but-verified, (that is, those for which the signing cert could not be found either in the store or the certificate  array) messages. If this flag is not set, then only the signed-and-verified messages will be accepted.
     * 
     * If <b>WSDAPI_COMPACTSIG_ACCEPT_ALL_MESSAGES</b> is specified, the caller will not be able use the <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdsignatureproperty">IWSDSignatureProperty</a> interface to learn whether the message was signed or not.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
