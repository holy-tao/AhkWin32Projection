#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HCERTSTORE.ahk

/**
 * The CTL_CONTEXT structure contains both the encoded and decoded representations of a CTL.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ctl_context
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CTL_CONTEXT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Type of encoding used. It is always acceptable to specify both the certificate and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">message encoding types</a> by combining them with a bitwise-<b>OR</b> operation as shown in the following example:
     * 
     * X509_ASN_ENCODING | PKCS_7_ASN_ENCODING
     * 
     * Currently defined encoding types are:
     * 
     * <ul>
     * <li>X509_ASN_ENCODING</li>
     * <li>PKCS_7_ASN_ENCODING</li>
     * </ul>
     * @type {Integer}
     */
    dwMsgAndCertEncodingType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the encoded CTL.
     * @type {Pointer<Integer>}
     */
    pbCtlEncoded {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size, in bytes, of the encoded CTL.
     * @type {Integer}
     */
    cbCtlEncoded {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_info">CTL_INFO</a> structure contain the CTL information.
     * @type {Pointer<CTL_INFO>}
     */
    pCtlInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A handle to the certificate store.
     * @type {HCERTSTORE}
     */
    hCertStore{
        get {
            if(!this.HasProp("__hCertStore"))
                this.__hCertStore := HCERTSTORE(32, this)
            return this.__hCertStore
        }
    }

    /**
     * Open <b>HCRYPTMSG</b> handle to a decoded, cryptographic-signed message containing the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_info">CTL_INFO</a> as its <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">inner content</a>.
     * @type {Pointer<Void>}
     */
    hCryptMsg {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">inner content</a> of the signed message.
     * @type {Pointer<Integer>}
     */
    pbCtlContent {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Count, in bytes, of <b>pbCtlContent</b>.
     * @type {Integer}
     */
    cbCtlContent {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
