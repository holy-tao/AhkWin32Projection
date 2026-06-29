#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DNS_WIRE_QUESTION structure contains information about a DNS question transmitted across the network as specified in section 4.1.2 of RFC 1035..
 * @remarks
 * When constructing a DNS message, the question name must precede the <b>DNS_WIRE_QUESTION</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_wire_question
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_WIRE_QUESTION {
    #StructPack 2

    /**
     * A value that represents the question section's <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Question Type</a>.
     */
    QuestionType : UInt16

    /**
     * A value that represents the question section's <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Question Class</a>.
     */
    QuestionClass : UInt16

}
