#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_HEADER.ahk" { DNS_HEADER }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The DNS_MESSAGE_BUFFER structure stores message information for DNS queries.
 * @remarks
 * The 
 * <b>DNS_MESSAGE_BUFFER</b> is used by the system to store DNS query information, and make that information available through various DNS function calls.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnswritequestiontobuffer_utf8">DnsWriteQuestionToBuffer</a> 
 * 	 method should be used to write a DNS query into a <b>DNS_MESSAGE_BUFFER</b> structure and the <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsextractrecordsfrommessage_utf8">DnsExtractRecordsFromMessage</a> method should be used to read the DNS RRs from a <b>DNS_MESSAGE_BUFFER</b>.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_message_buffer
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_MESSAGE_BUFFER {
    #StructPack 2

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windns/ns-windns-dns_header">DNS_HEADER</a> structure that contains the header for the DNS message.
     */
    MessageHead : DNS_HEADER

    /**
     * An array of characters that comprises the DNS query or resource records (RR).
     */
    MessageBody : CHAR[1]

}
