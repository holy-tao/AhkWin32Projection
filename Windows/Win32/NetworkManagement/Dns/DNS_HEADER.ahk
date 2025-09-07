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

    static packingSize => 1

    /**
     * A value that specifies the unique DNS message identifier.
     * @type {Integer}
     */
    Xid {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
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
