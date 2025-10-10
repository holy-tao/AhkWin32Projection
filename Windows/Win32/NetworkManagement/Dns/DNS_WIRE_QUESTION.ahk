#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DNS_WIRE_QUESTION structure contains information about a DNS question transmitted across the network as specified in section 4.1.2 of RFC 1035..
 * @remarks
 * 
  * When constructing a DNS message, the question name must precede the <b>DNS_WIRE_QUESTION</b> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_wire_question
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_WIRE_QUESTION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * A value that represents the question section's <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Question Type</a>.
     * @type {Integer}
     */
    QuestionType {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * A value that represents the question section's <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Question Class</a>.
     * @type {Integer}
     */
    QuestionClass {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
