#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DNS_HEADER.ahk

/**
 * The DNS_MESSAGE_BUFFER structure stores message information for DNS queries.
 * @remarks
 * 
  * The 
  * <b>DNS_MESSAGE_BUFFER</b> is used by the system to store DNS query information, and make that information available through various DNS function calls.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnswritequestiontobuffer_utf8">DnsWriteQuestionToBuffer</a> 
  * 	 method should be used to write a DNS query into a <b>DNS_MESSAGE_BUFFER</b> structure and the <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsextractrecordsfrommessage_utf8">DnsExtractRecordsFromMessage</a> method should be used to read the DNS RRs from a <b>DNS_MESSAGE_BUFFER</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_message_buffer
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_MESSAGE_BUFFER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windns/ns-windns-dns_header">DNS_HEADER</a> structure that contains the header for the DNS message.
     * @type {DNS_HEADER}
     */
    MessageHead{
        get {
            if(!this.HasProp("__MessageHead"))
                this.__MessageHead := DNS_HEADER(0, this)
            return this.__MessageHead
        }
    }

    /**
     * An array of characters that comprises the DNS query or resource records (RR).
     * @type {String}
     */
    MessageBody {
        get => StrGet(this.ptr + 12, 0, "UTF-16")
        set => StrPut(value, this.ptr + 12, 0, "UTF-16")
    }
}
