#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The DNS_TKEY_DATA structure represents a DNS TKEY resource record, used to establish and delete an algorithm's shared-secret keys between a DNS resolver and server as specified in RFC 2930. (Unicode)
 * @remarks
 * The 
 * <b>DNS_TKEY_DATA</b> structure is used in conjunction with the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The windns.h header defines DNS_TKEY_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_tkey_dataw
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @charset Unicode
 */
export default struct DNS_TKEY_DATAW {
    #StructPack 8

    /**
     * A pointer to a string that represents the name of the key as defined in section 2.1 of <a href="https://www.ietf.org/rfc/rfc2930.txt">RFC 2930</a>.
     */
    pNameAlgorithm : PWSTR

    /**
     * A pointer to a string representing the name of the   algorithm as defined in section 2.3 of <a href="https://www.ietf.org/rfc/rfc2930.txt">RFC 2930</a>. <b>pKey</b> is used to derive the algorithm specific keys.
     */
    pAlgorithmPacket : IntPtr

    /**
     * A pointer to the variable-length shared-secret key.
     */
    pKey : IntPtr

    /**
     * Reserved. Do not use.
     */
    pOtherData : IntPtr

    /**
     * The date and time at which the key was created, expressed in seconds since the beginning of January 1, 1970, Greenwich Mean Time (GMT), excluding leap seconds.
     */
    dwCreateTime : UInt32

    /**
     * The expiration date of the key, expressed in seconds since the beginning of January 1, 1970, Greenwich Mean Time (GMT), excluding leap seconds.
     */
    dwExpireTime : UInt32

    /**
     * A scheme used for key agreement or the purpose of the TKEY DNS Message. Possible values for <b>wMode</b> are listed below:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DNS_TKEY_MODE_SERVER_ASSIGN"></a><a id="dns_tkey_mode_server_assign"></a><dl>
     * <dt><b>DNS_TKEY_MODE_SERVER_ASSIGN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is assigned by the DNS server and is not negotiated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DNS_TKEY_MODE_DIFFIE_HELLMAN"></a><a id="dns_tkey_mode_diffie_hellman"></a><dl>
     * <dt><b>DNS_TKEY_MODE_DIFFIE_HELLMAN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Diffie-Hellman key exchange algorithm is used to negotiate the key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DNS_TKEY_MODE_GSS_"></a><a id="dns_tkey_mode_gss_"></a><dl>
     * <dt><b>DNS_TKEY_MODE_GSS </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is exchanged through Generic Security Services-Application Program Interface (GSS-API) negotiation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DNS_TKEY_MODE_RESOLVER_ASSIGN"></a><a id="dns_tkey_mode_resolver_assign"></a><dl>
     * <dt><b>DNS_TKEY_MODE_RESOLVER_ASSIGN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is assigned by the DNS resolver and is not negotiated.
     * 
     * </td>
     * </tr>
     * </table>
     */
    wMode : UInt16

    /**
     * An error, expressed in expanded RCODE format that covers TSIG and TKEY RR processing.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DNS_RCODE_BADSIG"></a><a id="dns_rcode_badsig"></a><dl>
     * <dt><b>DNS_RCODE_BADSIG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>pSignature</b> of the <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_tsig_dataw">DNS_TSIG_DATA</a> RR is bad.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DNS_RCODE_BADKEY"></a><a id="dns_rcode_badkey"></a><dl>
     * <dt><b>DNS_RCODE_BADKEY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>pKey</b> field is bad.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DNS_RCODE_BADTIME"></a><a id="dns_rcode_badtime"></a><dl>
     * <dt><b>DNS_RCODE_BADTIME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A timestamp is bad.
     * 
     * </td>
     * </tr>
     * </table>
     */
    wError : UInt16

    /**
     * Length, in bytes, of the <b>pKey</b> member.
     */
    wKeyLength : UInt16

    /**
     * The length, in bytes, of the <b>pOtherData</b> member.
     */
    wOtherLength : UInt16

    /**
     * The length, in bytes, of the <b>pNameAlgorithm</b> member.
     */
    cAlgNameLength : Int8

    /**
     * Reserved. Do not use.
     */
    bPacketPointers : BOOL

}
