#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DNS_HEADER structure contains DNS header information used when sending DNS messages as specified in section 4.1.1 of RFC 1035.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_header
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_HEADER {
    #StructPack 2

    /**
     * A value that specifies the unique DNS message identifier.
     */
    Xid : UInt16

    /**
     * This bitfield backs the following members:
     * - RecursionDesired
     * - Truncation
     * - Authoritative
     * - Opcode
     * - IsResponse
     */
    _bitfield1 : Int8


    /**
     * @type {Integer}
     */
    RecursionDesired {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Truncation {
        get => (this._bitfield1 >> 1) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 1) | (this._bitfield1 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Authoritative {
        get => (this._bitfield1 >> 2) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 2) | (this._bitfield1 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    Opcode {
        get => (this._bitfield1 >> 3) & 0xF
        set => this._bitfield1 := ((value & 0xF) << 3) | (this._bitfield1 & ~(0xF << 3))
    }

    /**
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
     */
    _bitfield2 : Int8


    /**
     * @type {Integer}
     */
    ResponseCode {
        get => (this._bitfield2 >> 0) & 0xF
        set => this._bitfield2 := ((value & 0xF) << 0) | (this._bitfield2 & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    CheckingDisabled {
        get => (this._bitfield2 >> 4) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 4) | (this._bitfield2 & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    AuthenticatedData {
        get => (this._bitfield2 >> 5) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 5) | (this._bitfield2 & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    RecursionAvailable {
        get => (this._bitfield2 >> 7) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 7) | (this._bitfield2 & ~(0x1 << 7))
    }
    /**
     * The number of queries contained in the question section of the DNS message.
     */
    QuestionCount : UInt16

    /**
     * The number of resource records (RRs) contained in the answer section of the DNS message.
     */
    AnswerCount : UInt16

    /**
     * The number of DNS name server RRs contained in the authority section of the DNS message. This value is the number of DNS name servers the message has traversed in its search for resolution.
     */
    NameServerCount : UInt16

    /**
     * Reserved. Do not use.
     */
    AdditionalCount : UInt16

}
