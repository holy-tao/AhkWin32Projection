#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a DS resource record (RR) as specified in section 2 of RFC 4034 and is used to verify the contents of DNS_DNSKEY_DATA.
 * @remarks
 * The 
 * <b>DNS_DS_DATA</b> structure is used in conjunction with the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_ds_data
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_DS_DATA extends Win32Struct
{
    static sizeof => 10

    static packingSize => 2

    /**
     * A value that represents the method to choose which public key is used to verify  <b>Signature</b> in <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_sig_dataw">DNS_RRSIG_DATA</a> as specified in Appendix B of <a href="https://www.ietf.org/rfc/rfc4034.txt">RFC 4034</a>. This value is identical to the <b>wKeyTag</b> field in <b>DNS_RRSIG_DATA</b>.
     * @type {Integer}
     */
    wKeyTag {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * A value that specifies the  algorithm defined by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd392295(v=vs.85)">DNS_DNSKEY_DATA</a>. The possible values are shown in the following table.
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
     * A value that specifies the cryptographic algorithm used to generate <b>Digest</b>. The possible values are shown in the following table.
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
     * SHA-1 (<a href="https://www.ietf.org/rfc/rfc3174.txt">RFC 3174</a>)
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    chDigestType {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * The length, in bytes. of the message digest in <b>Digest</b>. This value is determined by the algorithm type in <b>chDigestType</b>.
     * @type {Integer}
     */
    wDigestLength {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Reserved for padding. Do not use.
     * @type {Integer}
     */
    wPad {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * A <b>BYTE</b> array that contains a cryptographic digest of the DNSKEY RR and RDATA as specified in section 5.1.4 of <a href="https://www.ietf.org/rfc/rfc4034.txt">RFC 4034</a>. Its length is determined by <b>wDigestLength</b>.
     * @type {Array<Byte>}
     */
    Digest{
        get {
            if(!this.HasProp("__DigestProxyArray"))
                this.__DigestProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__DigestProxyArray
        }
    }
}
