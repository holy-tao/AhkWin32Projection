#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Structure represents a DNS Security Extensions (DNSSEC) cryptographic signature (SIG) resource record (RR) as specified in RFC 4034. (ANSI)
 * @remarks
 * The 
  * <b>DNS_RRSIG_DATA</b> structure is used in conjunction with the 
  * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The windns.h header defines DNS_SIG_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_sig_dataa
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 * @charset ANSI
 */
class DNS_SIG_DATAA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Record Type</a> of the signed RRs.
     * @type {Integer}
     */
    wTypeCovered {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * A value that specifies the  algorithm used to generate <b>Signature</b>. The possible values are shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="1"></a><dl>
     * <dt><b>1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RSA/MD5 (<a href="https://www.ietf.org/rfc/rfc2537.txt">RFC 2537</a>)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="2"></a><dl>
     * <dt><b>2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Diffie-Hellman (<a href="https://www.ietf.org/rfc/rfc2539.txt">RFC 2539</a>)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="3"></a><dl>
     * <dt><b>3</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DSA (<a href="https://www.ietf.org/rfc/rfc2536.txt">RFC 2536</a>)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="4"></a><dl>
     * <dt><b>4</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Elliptic curve cryptography
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="5"></a><dl>
     * <dt><b>5</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RSA/SHA-1 (<a href="https://www.ietf.org/rfc/rfc3110.txt">RFC 3110</a>)
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    chAlgorithm {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * The number of labels in the original signature RR owner name as specified in section 3.1.3 of <a href="https://www.ietf.org/rfc/rfc4034.txt">RFC 4034</a>.
     * @type {Integer}
     */
    chLabelCount {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * The Time-to-Live (TTL) value of the RR set signed by <b>Signature</b>.
     * @type {Integer}
     */
    dwOriginalTtl {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The expiration date of <b>Signature</b>, expressed in seconds since the beginning of January 1, 1970, Greenwich Mean Time (GMT), excluding leap seconds.
     * @type {Integer}
     */
    dwExpiration {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The date and time at which <b>Signature</b> becomes valid, expressed in seconds since the beginning of January 1, 1970, Greenwich Mean Time (GMT), excluding leap seconds.
     * @type {Integer}
     */
    dwTimeSigned {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A value that represents the method to choose which public key is used to verify  <b>Signature</b> as specified Appendix B of <a href="https://www.ietf.org/rfc/rfc4034.txt">RFC 4034</a>.
     * @type {Integer}
     */
    wKeyTag {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    wSignatureLength {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * A pointer to a string that represents  the name of the <b>Signature</b> generator.
     * @type {Pointer<PSTR>}
     */
    pNameSigner {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A <b>BYTE</b> array that contains the RR set signature as specified in section 3.1.8 of <a href="https://www.ietf.org/rfc/rfc4034.txt">RFC 4034</a>.
     * @type {Array<Byte>}
     */
    Signature{
        get {
            if(!this.HasProp("__SignatureProxyArray"))
                this.__SignatureProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "char")
            return this.__SignatureProxyArray
        }
    }
}
