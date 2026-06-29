#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DNS_SECTION enumeration is used in record flags, and as an index into DNS wire message header section counts.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ne-windns-dns_section
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_SECTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The DNS section specified is a DNS question.
     * @type {Integer (Int32)}
     */
    static DnsSectionQuestion => 0

    /**
     * The DNS section specified is a DNS answer.
     * @type {Integer (Int32)}
     */
    static DnsSectionAnswer => 1

    /**
     * The DNS section specified indicates a DNS authority.
     * @type {Integer (Int32)}
     */
    static DnsSectionAuthority => 2

    /**
     * The DNS section specified is additional DNS information.
     * @type {Integer (Int32)}
     */
    static DnsSectionAddtional => 3
}
