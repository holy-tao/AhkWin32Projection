#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DNS_HEADER structure contains DNS header information used when sending DNS messages as specified in section 4.1.1 of RFC 1035.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_header
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_HEADER extends Win32Struct
{
    static sizeof => 12

    static packingSize => 2

    /**
     * A value that specifies the unique DNS message identifier.
     * @type {Integer}
     */
    Xid {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - RecursionDesired
     * - Truncation
     * - Authoritative
     * - Opcode
     * - IsResponse
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * A value that specifies whether recursive name query should be used  by the DNS name server.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not use recursive name query.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use recursive name query.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    RecursionDesired {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * A value that specifies whether the DNS message has been truncated.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The message is not truncated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The message is truncated.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Truncation {
        get => (this._bitfield1 >> 1) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 1) | (this._bitfield1 & ~(0x1 << 1))
    }

    /**
     * A value that  specifies whether the DNS server from which the DNS message is being sent is authoritative for the domain name's zone.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DNS server is not authoritative in the zone.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DNS server is authoritative in the zone.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Authoritative {
        get => (this._bitfield1 >> 2) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 2) | (this._bitfield1 & ~(0x1 << 2))
    }

    /**
     * A value that specifies the operation code to be taken on the DNS message as defined in section 4.1.1 of <a href="https://www.ietf.org/rfc/rfc1035.txt">RFC 1035</a> as the <b>OPCODE</b> field.
     * @type {Integer}
     */
    Opcode {
        get => (this._bitfield1 >> 3) & 0xF
        set => this._bitfield1 := ((value & 0xF) << 3) | (this._bitfield1 & ~(0xF << 3))
    }

    /**
     * A value that specifies whether the DNS message is a query or a response message.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DNS message is a query.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DNS message is a response.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    IsResponse {
        get => (this._bitfield1 >> 7) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 7) | (this._bitfield1 & ~(0x1 << 7))
    }

    /**
     * This bitfield backs the following members:
     * - ResponseCode
     * - CheckingDisabled
     * - AuthenticatedData
     * - Reserved
     * - RecursionAvailable
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Response Code</a> of the message.
     * @type {Integer}
     */
    ResponseCode {
        get => (this._bitfield2 >> 0) & 0xF
        set => this._bitfield2 := ((value & 0xF) << 0) | (this._bitfield2 & ~(0xF << 0))
    }

    /**
     * Windows 7 or later: A value that specifies whether checking is supported by the DNS resolver.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Checking is enabled on the DNS resolver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Checking is disabled on the DNS resolver.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    CheckingDisabled {
        get => (this._bitfield2 >> 4) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 4) | (this._bitfield2 & ~(0x1 << 4))
    }

    /**
     * Windows 7 or later: A value that specifies whether the DNS data following the <b>DNS_HEADER</b> is authenticated by the DNS server.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DNS data is not authenticated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DNS data is authenticated.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    AuthenticatedData {
        get => (this._bitfield2 >> 5) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 5) | (this._bitfield2 & ~(0x1 << 5))
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    Reserved {
        get => (this._bitfield2 >> 6) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 6) | (this._bitfield2 & ~(0x1 << 6))
    }

    /**
     * A value that specifies whether recursive name query is supported by the DNS name server.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recursive name query is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recursive name query is supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    RecursionAvailable {
        get => (this._bitfield2 >> 7) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 7) | (this._bitfield2 & ~(0x1 << 7))
    }

    /**
     * The number of queries contained in the question section of the DNS message.
     * @type {Integer}
     */
    QuestionCount {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * The number of resource records (RRs) contained in the answer section of the DNS message.
     * @type {Integer}
     */
    AnswerCount {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * The number of DNS name server RRs contained in the authority section of the DNS message. This value is the number of DNS name servers the message has traversed in its search for resolution.
     * @type {Integer}
     */
    NameServerCount {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    AdditionalCount {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }
}
