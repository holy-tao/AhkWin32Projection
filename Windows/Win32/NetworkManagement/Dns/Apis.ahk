#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\DNS_MESSAGE_BUFFER.ahk" { DNS_MESSAGE_BUFFER }
#Import ".\DNS_CONNECTION_NAME_LIST.ahk" { DNS_CONNECTION_NAME_LIST }
#Import ".\DNS_APPLICATION_SETTINGS.ahk" { DNS_APPLICATION_SETTINGS }
#Import ".\DNS_QUERY_CANCEL.ahk" { DNS_QUERY_CANCEL }
#Import ".\MDNS_QUERY_HANDLE.ahk" { MDNS_QUERY_HANDLE }
#Import ".\DNS_QUERY_RAW_CANCEL.ahk" { DNS_QUERY_RAW_CANCEL }
#Import ".\DNS_CONNECTION_POLICY_ENTRY_LIST.ahk" { DNS_CONNECTION_POLICY_ENTRY_LIST }
#Import "..\..\Foundation\WIN32_ERROR.ahk" { WIN32_ERROR }
#Import ".\DNS_SERVICE_REGISTER_REQUEST.ahk" { DNS_SERVICE_REGISTER_REQUEST }
#Import ".\DNS_CHARSET.ahk" { DNS_CHARSET }
#Import ".\DNS_QUERY_RAW_RESULT.ahk" { DNS_QUERY_RAW_RESULT }
#Import ".\DNS_PROXY_INFORMATION.ahk" { DNS_PROXY_INFORMATION }
#Import ".\DNS_CONNECTION_PROXY_TYPE.ahk" { DNS_CONNECTION_PROXY_TYPE }
#Import ".\DNS_SERVICE_RESOLVE_REQUEST.ahk" { DNS_SERVICE_RESOLVE_REQUEST }
#Import ".\DNS_QUERY_REQUEST.ahk" { DNS_QUERY_REQUEST }
#Import ".\DNS_QUERY_OPTIONS.ahk" { DNS_QUERY_OPTIONS }
#Import ".\DNS_CONFIG_TYPE.ahk" { DNS_CONFIG_TYPE }
#Import ".\DNS_SERVICE_BROWSE_REQUEST.ahk" { DNS_SERVICE_BROWSE_REQUEST }
#Import ".\DNS_RECORDA.ahk" { DNS_RECORDA }
#Import ".\DNS_CONNECTION_PROXY_INFO.ahk" { DNS_CONNECTION_PROXY_INFO }
#Import ".\DNS_FREE_TYPE.ahk" { DNS_FREE_TYPE }
#Import ".\DNS_SERVICE_INSTANCE.ahk" { DNS_SERVICE_INSTANCE }
#Import ".\DNS_NAME_FORMAT.ahk" { DNS_NAME_FORMAT }
#Import ".\DNS_CONNECTION_POLICY_TAG.ahk" { DNS_CONNECTION_POLICY_TAG }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DNS_CONNECTION_PROXY_LIST.ahk" { DNS_CONNECTION_PROXY_LIST }
#Import ".\DNS_QUERY_RESULT.ahk" { DNS_QUERY_RESULT }
#Import ".\DNS_CONNECTION_IFINDEX_LIST.ahk" { DNS_CONNECTION_IFINDEX_LIST }
#Import ".\IP6_ADDRESS.ahk" { IP6_ADDRESS }
#Import ".\DNS_SERVICE_CANCEL.ahk" { DNS_SERVICE_CANCEL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\DNS_CUSTOM_SERVER.ahk" { DNS_CUSTOM_SERVER }
#Import ".\DNS_CONNECTION_PROXY_INFO_EX.ahk" { DNS_CONNECTION_PROXY_INFO_EX }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\MDNS_QUERY_REQUEST.ahk" { MDNS_QUERY_REQUEST }
#Import ".\DNS_QUERY_RAW_REQUEST.ahk" { DNS_QUERY_RAW_REQUEST }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */

;@region Functions
/**
 * The DnsQueryConfig function enables application programmers to query for the configuration of the local computer or a specific adapter.
 * @param {DNS_CONFIG_TYPE} Config A <a href="https://docs.microsoft.com/windows/win32/api/windns/ne-windns-dns_config_type">DNS_CONFIG_TYPE</a> value that specifies the configuration type of the information to be queried.
 * @param {Integer} Flag A value that specifies whether to allocate memory for the configuration information. Set <i>Flag</i> to <b>DNS_CONFIG_FLAG_ALLOC </b> to allocate memory; otherwise, set it to 0.  
 * 
 * <div class="alert"><b>Note</b>  Free the allocated memory with <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a>.</div>
 * <div> </div>
 * @param {PWSTR} pwsAdapterName A pointer to a string that represents the adapter name against which the query is run.
 * @param {Pointer<Void>} pReserved Reserved for future use.
 * @param {Integer} pBuffer A pointer to a buffer that receives the query response. The following table shows the data type of the buffer for each  of the <i>Config</i> parameter values.
 * 
 * <table>
 * <tr>
 * <th><i>Config</i> parameter</th>
 * <th>Data type of buffer</th>
 * </tr>
 * <tr>
 * <td>DnsConfigPrimaryDomainName_W</td>
 * <td>PWCHAR</td>
 * </tr>
 * <tr>
 * <td>DnsConfigPrimaryDomainName_A</td>
 * <td>PCHAR</td>
 * </tr>
 * <tr>
 * <td>DnsConfigPrimaryDomainName_UTF8</td>
 * <td>PCHAR</td>
 * </tr>
 * <tr>
 * <td>DnsConfigAdapterDomainName_W</td>
 * <td>Not implemented</td>
 * </tr>
 * <tr>
 * <td>DnsConfigAdapterDomainName_A</td>
 * <td>Not implemented</td>
 * </tr>
 * <tr>
 * <td>DnsConfigAdapterDomainName_UTF8</td>
 * <td>Not implemented</td>
 * </tr>
 * <tr>
 * <td>DnsConfigDnsServerList</td>
 * <td>IP4_ARRAY</td>
 * </tr>
 * <tr>
 * <td>DnsConfigSearchList</td>
 * <td>Not implemented</td>
 * </tr>
 * <tr>
 * <td>DnsConfigAdapterInfo</td>
 * <td>Not implemented</td>
 * </tr>
 * <tr>
 * <td>DnsConfigPrimaryHostNameRegistrationEnabled</td>
 * <td>DWORD</td>
 * </tr>
 * <tr>
 * <td>DnsConfigAdapterHostNameRegistrationEnabled</td>
 * <td>DWORD</td>
 * </tr>
 * <tr>
 * <td>DnsConfigAddressRegistrationMaxCount</td>
 * <td>DWORD</td>
 * </tr>
 * <tr>
 * <td>DnsConfigHostName_W</td>
 * <td>PWCHAR</td>
 * </tr>
 * <tr>
 * <td>DnsConfigHostName_A</td>
 * <td>PCHAR</td>
 * </tr>
 * <tr>
 * <td>DnsConfigHostName_UTF8</td>
 * <td>PCHAR</td>
 * </tr>
 * <tr>
 * <td>DnsConfigFullHostName_W</td>
 * <td>PWCHAR</td>
 * </tr>
 * <tr>
 * <td>DnsConfigFullHostName_A</td>
 * <td>PCHAR</td>
 * </tr>
 * <tr>
 * <td>DnsConfigFullHostName_UTF8</td>
 * <td>PCHAR</td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} pBufLen The length of the buffer, in bytes. If the buffer provided is not sufficient, an error is returned and <i>pBufferLength</i> contains the minimum necessary buffer size. Ignored on input if <i>Flag</i> is set to <b>TRUE</b>.
 * @returns {Integer} Returns success confirmation upon successful completion. Otherwise, returns the appropriate DNS-specific error code as defined in Winerror.h.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsqueryconfig
 * @since windows5.0
 */
export DnsQueryConfig(Config, Flag, pwsAdapterName, pReserved, pBuffer, pBufLen) {
    pwsAdapterName := pwsAdapterName is String ? StrPtr(pwsAdapterName) : pwsAdapterName

    pReservedMarshal := pReserved is VarRef ? "ptr" : "ptr"
    pBufLenMarshal := pBufLen is VarRef ? "uint*" : "ptr"

    result := DllCall("DNSAPI.dll\DnsQueryConfig", DNS_CONFIG_TYPE, Config, "uint", Flag, "ptr", pwsAdapterName, pReservedMarshal, pReserved, "ptr", pBuffer, pBufLenMarshal, pBufLen, Int32)
    return result
}

/**
 * The DnsRecordCopyEx function creates a copy of a specified resource record (RR). The DnsRecordCopyEx function is also capable of converting the character encoding during the copy operation.
 * @remarks
 * The <i>CharSetIn</i> parameter is used only if the character encoding of the source RR is not specified in <i>pRecord</i>.
 * @param {Pointer<DNS_RECORDA>} pRecord A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the RR to be copied.
 * @param {DNS_CHARSET} CharSetIn A <a href="https://docs.microsoft.com/windows/desktop/api/windns/ne-windns-dns_charset">DNS_CHARSET</a> value that specifies the character encoding of the source RR.
 * @param {DNS_CHARSET} CharSetOut A <a href="https://docs.microsoft.com/windows/desktop/api/windns/ne-windns-dns_charset">DNS_CHARSET</a> value that specifies the character encoding required of the destination record.
 * @returns {Pointer<DNS_RECORDA>} Successful execution returns a pointer to the (newly created) destination record. Otherwise, returns null.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsrecordcopyex
 * @since windows5.0
 */
export DnsRecordCopyEx(pRecord, CharSetIn, CharSetOut) {
    result := DllCall("DNSAPI.dll\DnsRecordCopyEx", DNS_RECORDA.Ptr, pRecord, DNS_CHARSET, CharSetIn, DNS_CHARSET, CharSetOut, DNS_RECORDA.Ptr)
    return result
}

/**
 * The DnsRecordSetCopyEx function creates a copy of a specified resource record set. The DnsRecordSetCopyEx function is also capable of converting the character encoding during the copy operation.
 * @remarks
 * The <i>CharSetIn</i> parameter is used only if the character encoding of the source resource record set is not specified in <i>pRecordSet</i>.
 * @param {Pointer<DNS_RECORDA>} pRecordSet A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the resource record set to be copied.
 * @param {DNS_CHARSET} CharSetIn A <a href="https://docs.microsoft.com/windows/desktop/api/windns/ne-windns-dns_charset">DNS_CHARSET</a> value that specifies the character encoding of the source resource record set.
 * @param {DNS_CHARSET} CharSetOut A <a href="https://docs.microsoft.com/windows/desktop/api/windns/ne-windns-dns_charset">DNS_CHARSET</a> value that specifies the character encoding required of the destination record set.
 * @returns {Pointer<DNS_RECORDA>} Successful execution returns a pointer to the newly created destination record set. Otherwise, it returns null.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsrecordsetcopyex
 * @since windows5.0
 */
export DnsRecordSetCopyEx(pRecordSet, CharSetIn, CharSetOut) {
    result := DllCall("DNSAPI.dll\DnsRecordSetCopyEx", DNS_RECORDA.Ptr, pRecordSet, DNS_CHARSET, CharSetIn, DNS_CHARSET, CharSetOut, DNS_RECORDA.Ptr)
    return result
}

/**
 * The DnsRecordCompare function compares two DNS resource records (RR).
 * @remarks
 * When comparing records, DNS RRs that are stored using different character encoding are treated by the 
 * <b>DnsRecordCompare</b> function as different, even if the records are otherwise equivalent.
 * @param {Pointer<DNS_RECORDA>} pRecord1 A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the first DNS RR of the comparison pair.
 * @param {Pointer<DNS_RECORDA>} pRecord2 A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the second DNS RR of the comparison pair.
 * @returns {BOOL} Returns <b>TRUE</b> if the compared records are equivalent, <b>FALSE</b> if they are not.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsrecordcompare
 * @since windows5.0
 */
export DnsRecordCompare(pRecord1, pRecord2) {
    result := DllCall("DNSAPI.dll\DnsRecordCompare", DNS_RECORDA.Ptr, pRecord1, DNS_RECORDA.Ptr, pRecord2, BOOL)
    return result
}

/**
 * The DnsRecordSetCompare function compares two RR sets.
 * @remarks
 * When comparing record sets, DNS resource records that are stored using different character encoding are treated by the 
 * <b>DnsRecordSetCompare</b> function as equivalent. Contrast this to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsrecordcompare">DnsRecordCompare</a> function, in which equivalent records with different encoding are not returned as equivalent records.
 * @param {Pointer<DNS_RECORDA>} pRR1 A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the first DNS RR set of the comparison pair.
 * @param {Pointer<DNS_RECORDA>} pRR2 A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the second DNS resource record set of the comparison pair.
 * @param {Pointer<Pointer<DNS_RECORDA>>} ppDiff1 A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> pointer that contains the list of resource records built as a result of the arithmetic performed on them: <b>pRRSet1</b> minus <b>pRRSet2</b>.
 * @param {Pointer<Pointer<DNS_RECORDA>>} ppDiff2 A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> pointer that contains the list of resource records built as a result of the arithmetic performed on them: <b>pRRSet2</b> minus <b>pRRSet1</b>.
 * @returns {BOOL} Returns <b>TRUE</b> if the compared record sets are equivalent, <b>FALSE</b> if they are not.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsrecordsetcompare
 * @since windows5.0
 */
export DnsRecordSetCompare(pRR1, pRR2, ppDiff1, ppDiff2) {
    ppDiff1Marshal := ppDiff1 is VarRef ? "ptr*" : "ptr"
    ppDiff2Marshal := ppDiff2 is VarRef ? "ptr*" : "ptr"

    result := DllCall("DNSAPI.dll\DnsRecordSetCompare", DNS_RECORDA.Ptr, pRR1, DNS_RECORDA.Ptr, pRR2, ppDiff1Marshal, ppDiff1, ppDiff2Marshal, ppDiff2, BOOL)
    return result
}

/**
 * The DnsRecordSetDetach function detaches the first record set from a specified list of DNS records.
 * @param {Pointer<DNS_RECORDA>} pRecordList A pointer, on input, to a <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the list prior to the detachment of the first DNS record in the list of DNS records.  A pointer, on output to a <b>DNS_RECORD</b> structure that contains the list subsequent to the detachment of the DNS record.
 * @returns {Pointer<DNS_RECORDA>} On return, the <b>DnsRecordSetDetach</b> function points to the detached DNS record set.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsrecordsetdetach
 * @since windows5.0
 */
export DnsRecordSetDetach(pRecordList) {
    result := DllCall("DNSAPI.dll\DnsRecordSetDetach", DNS_RECORDA.Ptr, pRecordList, DNS_RECORDA.Ptr)
    return result
}

/**
 * Frees memory allocated for DNS records that was obtained using the DnsQuery function.
 * @param {Pointer<Void>} pData A pointer to the DNS data to be freed.
 * @param {DNS_FREE_TYPE} FreeType A value that specifies the type of DNS data in <i>pData</i>. For more information and a list of values, see the <a href="https://docs.microsoft.com/windows/win32/api/windns/ne-windns-dns_free_type">DNS_FREE_TYPE</a> enumeration.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsfree
 * @since windows5.1.2600
 */
export DnsFree(pData, FreeType) {
    pDataMarshal := pData is VarRef ? "ptr" : "ptr"

    DllCall("DNSAPI.dll\DnsFree", pDataMarshal, pData, DNS_FREE_TYPE, FreeType)
}

/**
 * 
 * @param {Pointer<DNS_RECORDA>} pRecord 
 * @param {Integer} ullFlags 
 * @param {Pointer<BOOL>} pfFlat 
 * @returns {Integer} 
 */
export DnsIsFlatRecord(pRecord, ullFlags, pfFlat) {
    pfFlatMarshal := pfFlat is VarRef ? "int*" : "ptr"

    result := DllCall("DNSAPI.dll\DnsIsFlatRecord", DNS_RECORDA.Ptr, pRecord, "uint", ullFlags, pfFlatMarshal, pfFlat, Int32)
    return result
}

/**
 * Is the generic query interface to the DNS namespace, and provides application developers with a DNS query resolution interface. (DnsQuery_A)
 * @remarks
 * Applications that call the 
 * <b>DnsQuery</b> function build a query using a fully qualified DNS name and Resource Record (RR) type, and set query options depending on the type of service desired. When the <b>DNS_QUERY_STANDARD</b> option is set, DNS uses the resolver cache, queries first with UDP, then retries with TCP if the response is truncated, and requests that the server to perform recursive resolution on behalf of the client to resolve the query.
 * 
 * Applications must free returned RR sets with the <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsrecordlistfree">DnsRecordListFree</a> function.
 * 
 * <div class="alert"><b>Note</b>  When calling one of the 
 * <b>DnsQuery</b> function types, be aware that a DNS server may return multiple records in response to a query. A computer that is multihomed, for example, will receive multiple A records for the same IP address. The caller must use as many of the returned records as necessary.</div>
 * <div> </div>
 * Consider the following scenario, in which multiple returned records require additional activity on behalf of the application: A <b>DnsQuery_A</b> function call is made for a multihomed computer and the application finds that the address associated with the first A record is not responding. The application should then attempt to use other IP addresses specified in the (additional) A records returned from the <b>DnsQuery_A</b> function call.
 * 
 *  If the <i>lpstrName </i> parameter is set to <b>NULL</b>, the <b>DnsQuery</b> function fails with the error <b>INVALID_PARAMETER</b>.
 * @param {PSTR} pszName A pointer to a string that represents the DNS name to query.
 * @param {Integer} wType A value that represents the Resource Record (RR)<a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Record Type</a> that is queried. <b>wType</b> determines the format of data pointed to by <b>ppQueryResultsSet</b>. For example, if the value of <b>wType</b> is <b>DNS_TYPE_A</b>, the format of data pointed to by <b>ppQueryResultsSet</b> is <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_a_data">DNS_A_DATA</a>.
 * @param {DNS_QUERY_OPTIONS} Options A value that contains a bitmap of <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Query  Options</a> to use in the DNS query. Options can be combined and all options override <b>DNS_QUERY_STANDARD</b>.
 * @param {Pointer<Void>} pExtra This parameter is reserved for future use and must be set to <b>NULL</b>.
 * @param {Pointer<Pointer<DNS_RECORDA>>} ppQueryResults Optional. A pointer to a pointer that points to the list of RRs that comprise the response. For more information, see the Remarks section.
 * @param {Pointer<Pointer<Void>>} pReserved This parameter is reserved for future use and must be set to <b>NULL</b>.
 * @returns {WIN32_ERROR} Returns success confirmation upon successful completion. Otherwise, returns the appropriate DNS-specific error code as defined in Winerror.h.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsquery_a
 * @since windows5.0
 */
export DnsQuery_A(pszName, wType, Options, pExtra, ppQueryResults, pReserved) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    pExtraMarshal := pExtra is VarRef ? "ptr" : "ptr"
    ppQueryResultsMarshal := ppQueryResults is VarRef ? "ptr*" : "ptr"
    pReservedMarshal := pReserved is VarRef ? "ptr*" : "ptr"

    result := DllCall("DNSAPI.dll\DnsQuery_A", "ptr", pszName, "ushort", wType, DNS_QUERY_OPTIONS, Options, pExtraMarshal, pExtra, ppQueryResultsMarshal, ppQueryResults, pReservedMarshal, pReserved, WIN32_ERROR)
    return result
}

/**
 * Is the generic query interface to the DNS namespace, and provides application developers with a DNS query resolution interface. (DnsQuery_UTF8)
 * @remarks
 * Applications that call the 
 * <b>DnsQuery</b> function build a query using a fully qualified DNS name and Resource Record (RR) type, and set query options depending on the type of service desired. When the <b>DNS_QUERY_STANDARD</b> option is set, DNS uses the resolver cache, queries first with UDP, then retries with TCP if the response is truncated, and requests that the server to perform recursive resolution on behalf of the client to resolve the query.
 * 
 * Applications must free returned RR sets with the <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsrecordlistfree">DnsRecordListFree</a> function.
 * 
 * <div class="alert"><b>Note</b>  When calling one of the 
 * <b>DnsQuery</b> function types, be aware that a DNS server may return multiple records in response to a query. A computer that is multihomed, for example, will receive multiple A records for the same IP address. The caller must use as many of the returned records as necessary.</div>
 * <div> </div>
 * Consider the following scenario, in which multiple returned records require additional activity on behalf of the application: A <b>DnsQuery_A</b> function call is made for a multihomed computer and the application finds that the address associated with the first A record is not responding. The application should then attempt to use other IP addresses specified in the (additional) A records returned from the <b>DnsQuery_A</b> function call.
 * 
 *  If the <i>lpstrName </i> parameter is set to <b>NULL</b>, the <b>DnsQuery</b> function fails with the error <b>INVALID_PARAMETER</b>.
 * @param {PSTR} pszName A pointer to a string that represents the DNS name to query.
 * @param {Integer} wType A value that represents the Resource Record (RR)<a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Record Type</a> that is queried. <b>wType</b> determines the format of data pointed to by <b>ppQueryResultsSet</b>. For example, if the value of <b>wType</b> is <b>DNS_TYPE_A</b>, the format of data pointed to by <b>ppQueryResultsSet</b> is <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_a_data">DNS_A_DATA</a>.
 * @param {DNS_QUERY_OPTIONS} Options A value that contains a bitmap of <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Query  Options</a> to use in the DNS query. Options can be combined and all options override <b>DNS_QUERY_STANDARD</b>.
 * @param {Pointer<Void>} pExtra This parameter is reserved for future use and must be set to <b>NULL</b>.
 * @param {Pointer<Pointer<DNS_RECORDA>>} ppQueryResults Optional. A pointer to a pointer that points to the list of RRs that comprise the response. For more information, see the Remarks section.
 * @param {Pointer<Pointer<Void>>} pReserved This parameter is reserved for future use and must be set to <b>NULL</b>.
 * @returns {WIN32_ERROR} Returns success confirmation upon successful completion. Otherwise, returns the appropriate DNS-specific error code as defined in Winerror.h.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsquery_utf8
 * @since windows5.0
 */
export DnsQuery_UTF8(pszName, wType, Options, pExtra, ppQueryResults, pReserved) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    pExtraMarshal := pExtra is VarRef ? "ptr" : "ptr"
    ppQueryResultsMarshal := ppQueryResults is VarRef ? "ptr*" : "ptr"
    pReservedMarshal := pReserved is VarRef ? "ptr*" : "ptr"

    result := DllCall("DNSAPI.dll\DnsQuery_UTF8", "ptr", pszName, "ushort", wType, DNS_QUERY_OPTIONS, Options, pExtraMarshal, pExtra, ppQueryResultsMarshal, ppQueryResults, pReservedMarshal, pReserved, WIN32_ERROR)
    return result
}

/**
 * Is the generic query interface to the DNS namespace, and provides application developers with a DNS query resolution interface. (DnsQuery_W)
 * @remarks
 * Applications that call the 
 * <b>DnsQuery</b> function build a query using a fully qualified DNS name and Resource Record (RR) type, and set query options depending on the type of service desired. When the <b>DNS_QUERY_STANDARD</b> option is set, DNS uses the resolver cache, queries first with UDP, then retries with TCP if the response is truncated, and requests that the server to perform recursive resolution on behalf of the client to resolve the query.
 * 
 * Applications must free returned RR sets with the <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsrecordlistfree">DnsRecordListFree</a> function.
 * 
 * <div class="alert"><b>Note</b>  When calling one of the 
 * <b>DnsQuery</b> function types, be aware that a DNS server may return multiple records in response to a query. A computer that is multihomed, for example, will receive multiple A records for the same IP address. The caller must use as many of the returned records as necessary.</div>
 * <div> </div>
 * Consider the following scenario, in which multiple returned records require additional activity on behalf of the application: A <b>DnsQuery_A</b> function call is made for a multihomed computer and the application finds that the address associated with the first A record is not responding. The application should then attempt to use other IP addresses specified in the (additional) A records returned from the <b>DnsQuery_A</b> function call.
 * 
 *  If the <i>lpstrName </i> parameter is set to <b>NULL</b>, the <b>DnsQuery</b> function fails with the error <b>INVALID_PARAMETER</b>.
 * @param {PWSTR} pszName A pointer to a string that represents the DNS name to query.
 * @param {Integer} wType A value that represents the Resource Record (RR)<a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Record Type</a> that is queried. <b>wType</b> determines the format of data pointed to by <b>ppQueryResultsSet</b>. For example, if the value of <b>wType</b> is <b>DNS_TYPE_A</b>, the format of data pointed to by <b>ppQueryResultsSet</b> is <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_a_data">DNS_A_DATA</a>.
 * @param {DNS_QUERY_OPTIONS} Options A value that contains a bitmap of <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Query  Options</a> to use in the DNS query. Options can be combined and all options override <b>DNS_QUERY_STANDARD</b>.
 * @param {Pointer<Void>} pExtra This parameter is reserved for future use and must be set to <b>NULL</b>.
 * @param {Pointer<Pointer<DNS_RECORDA>>} ppQueryResults Optional. A pointer to a pointer that points to the list of RRs that comprise the response. For more information, see the Remarks section.
 * @param {Pointer<Pointer<Void>>} pReserved This parameter is reserved for future use and must be set to <b>NULL</b>.
 * @returns {WIN32_ERROR} Returns success confirmation upon successful completion. Otherwise, returns the appropriate DNS-specific error code as defined in Winerror.h.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsquery_w
 * @since windows5.0
 */
export DnsQuery_W(pszName, wType, Options, pExtra, ppQueryResults, pReserved) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    pExtraMarshal := pExtra is VarRef ? "ptr" : "ptr"
    ppQueryResultsMarshal := ppQueryResults is VarRef ? "ptr*" : "ptr"
    pReservedMarshal := pReserved is VarRef ? "ptr*" : "ptr"

    result := DllCall("DNSAPI.dll\DnsQuery_W", "ptr", pszName, "ushort", wType, DNS_QUERY_OPTIONS, Options, pExtraMarshal, pExtra, ppQueryResultsMarshal, ppQueryResults, pReservedMarshal, pReserved, WIN32_ERROR)
    return result
}

/**
 * Frees the array of custom servers that was returned from a previous call to [DnsGetApplicationSettings](/windows/win32/api/windns/nf-windns-dnsgetapplicationsettings).
 * @remarks
 * To avoid memory leaks, you must call **DnsFreeCustomServers** on the servers returned by [DnsGetApplicationSettings](nf-windns-dnsgetapplicationsettings.md) via its *pSettings* parameter.
 * @param {Pointer<Integer>} pcServers Type: \_Inout\_ **[DWORD](/windows/win32/winprog/windows-data-types)\***
 * 
 * A pointer to a **DWORD** that contains the number of servers present in the array pointed to by *ppServers*. This will be set to 0 after the function call.
 * @param {Pointer<Pointer<DNS_CUSTOM_SERVER>>} ppServers Type: \_Inout\_ **[DNS_CUSTOM_SERVER](ns-windns-dns_custom_server)\*\***
 * 
 * A pointer to an array of [DNS_CUSTOM_SERVER](ns-windns-dns_custom_server) that contains *pcServers* elements. This will be set to **NULL** after the function call.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsfreecustomservers
 */
export DnsFreeCustomServers(pcServers, ppServers) {
    pcServersMarshal := pcServers is VarRef ? "uint*" : "ptr"
    ppServersMarshal := ppServers is VarRef ? "ptr*" : "ptr"

    DllCall("DNSAPI.dll\DnsFreeCustomServers", pcServersMarshal, pcServers, ppServersMarshal, ppServers)
}

/**
 * Retrieves the per-application DNS settings.
 * @remarks
 * To avoid memory leaks, you must call [DnsFreeCustomServers](nf-windns-dnsfreecustomservers.md) on the servers returned by **DnsGetApplicationSettings** via its *pSettings* parameter.
 * @param {Pointer<Integer>} pcServers Type: \_Out\_ **[DWORD](/windows/win32/winprog/windows-data-types)\***
 * 
 * After the function call, this will point to the number of custom DNS servers that the application has configured. If there are no custom servers configured, or if the function fails, then this will be set to 0.
 * @param {Pointer<Pointer<DNS_CUSTOM_SERVER>>} ppDefaultServers Type: \_Outptr\_result\_buffer\_(*pcServers) **[DNS_CUSTOM_SERVER](ns-windns-dns_custom_server)\*\***
 * 
 * After the function call, this will point to the array of DNS custom servers that are configured for the application. If the application has no servers configured, or if the function fails, then this will be set to **NULL**.
 * @param {Pointer<DNS_APPLICATION_SETTINGS>} pSettings Type: \_Out\_opt\_ **[DNS_APPLICATION_SETTINGS](ns-windns-dns_application_settings.md)\***
 * 
 * A pointer to a [DNS_APPLICATION_SETTINGS](ns-windns-dns_application_settings.md) object, populated with the application settings.
 * @returns {Integer} A **DWORD** containing **ERROR_SUCCESS** on success, or an error code on failure.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsgetapplicationsettings
 */
export DnsGetApplicationSettings(pcServers, ppDefaultServers, pSettings) {
    pcServersMarshal := pcServers is VarRef ? "uint*" : "ptr"
    ppDefaultServersMarshal := ppDefaultServers is VarRef ? "ptr*" : "ptr"

    result := DllCall("DNSAPI.dll\DnsGetApplicationSettings", pcServersMarshal, pcServers, ppDefaultServersMarshal, ppDefaultServers, DNS_APPLICATION_SETTINGS.Ptr, pSettings, UInt32)
    return result
}

/**
 * Configures per-application DNS settings. This includes the ability to set per-application DNS servers either as fallback to the system configured servers, or exclusively.
 * @param {Integer} cServers Type: \_In\_ **[DWORD](/windows/win32/winprog/windows-data-types)**
 * 
 * The number of custom DNS servers present in the *pServers* parameter.
 * @param {Pointer<DNS_CUSTOM_SERVER>} pServers Type: \_In\_reads\_(cServers) **[DNS_CUSTOM_SERVER](ns-windns-dns_custom_server)\***
 * 
 * An array of [DNS_CUSTOM_SERVER](ns-windns-dns_custom_server) that contains *cServers* elements. If *cServers* is 0, then this must be **NULL**.
 * @param {Pointer<DNS_APPLICATION_SETTINGS>} pSettings Type: \_In\_opt\_ **[DNS_APPLICATION_SETTINGS](ns-windns-dns_application_settings.md)\***
 * 
 * A pointer to a [DNS_APPLICATION_SETTINGS](ns-windns-dns_application_settings.md) object describing additional settings for custom DNS servers.
 * 
 * If this is **NULL**, then the custom DNS servers passed to the API will be used as fallback to the system-configured ones.
 * 
 * If this points to a [DNS_APPLICATION_SETTINGS](ns-windns-dns_application_settings.md) object that has the **DNS_APP_SETTINGS_EXCLUSIVE_SERVERS** flag set in its *Flags* member, then it means use the custom DNS servers exclusively.
 * @returns {Integer} A **DWORD** containing **ERROR_SUCCESS** on success, or an error code on failure.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnssetapplicationsettings
 */
export DnsSetApplicationSettings(cServers, pServers, pSettings) {
    result := DllCall("DNSAPI.dll\DnsSetApplicationSettings", "uint", cServers, DNS_CUSTOM_SERVER.Ptr, pServers, DNS_APPLICATION_SETTINGS.Ptr, pSettings, UInt32)
    return result
}

/**
 * The asynchronous generic query interface to the DNS namespace, and provides application developers with a DNS query resolution interface.
 * @remarks
 * If a call to <b>DnsQueryEx</b> completes synchronously (i.e., the function return value is not <b>DNS_REQUEST_PENDING</b>), the <b>pQueryRecords</b> member of <i>pQueryResults</i> contains a pointer to a list of <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORDS</a> and <b>DnsQueryEx</b> will return either error or success.
 * 
 * The following conditions invoke a synchronous call to <b>DnsQueryEx</b> and do not utilize the DNS callback:
 * 
 * <ul>
 * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/windns/nc-windns-dns_query_completion_routine">DNS_QUERY_COMPLETION_ROUTINE</a> callback is omitted from the <b>pQueryCompleteCallback</b> member of <i>pQueryRequest</i>.</li>
 * <li>A query is for the local machine name and <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_a_data">A</a> or <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_aaaa_data">AAAA</a> type Resource Records (RR).</li>
 * <li>A call to <b>DnsQueryEx</b> queries an IPv4 or IPv6 address.</li>
 * <li>A call to <b>DnsQueryEx</b> returns in error.</li>
 * </ul>
 * If a call to <b>DnsQueryEx</b> completes asynchronously, the results of the query are returned by the <a href="https://docs.microsoft.com/windows/desktop/api/windns/nc-windns-dns_query_completion_routine">DNS_QUERY_COMPLETION_ROUTINE</a> callback in <i>pQueryRequest</i>, the <b>QueryStatus</b> member of <i>pQueryResults</i> contains <b>DNS_REQUEST_PENDING</b>, and <b>DnsQueryEx</b> returns <b>DNS_REQUEST_PENDING</b>. Applications should track the <i>pQueryResults</i> structure that is passed into <b>DnsQueryEx</b> until the DNS callback succeeds. Applications can cancel an asynchronous query using the <i>pCancelHandle</i> handle returned by <b>DnsQueryEx</b>.
 * 
 * <i>pCancelHandle</i> returned from an asynchronous call to <b>DnsQueryEx</b> and <i>pQueryContext</i> is valid until the <a href="https://docs.microsoft.com/windows/desktop/api/windns/nc-windns-dns_query_completion_routine">DNS_QUERY_COMPLETION_ROUTINE</a> DNS callback is invoked.
 * 
 * <div class="alert"><b>Note</b>  Applications are notified of asynchronous <b>DnsQueryEx</b> completion through the <a href="https://docs.microsoft.com/windows/desktop/api/windns/nc-windns-dns_query_completion_routine">DNS_QUERY_COMPLETION_ROUTINE</a> callback within the same process context.</div>
 * <div> </div>
 * @param {Pointer<DNS_QUERY_REQUEST>} pQueryRequest A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windns/ns-windns-dns_query_request">DNS_QUERY_REQUEST</a> or <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_query_request3">DNS_QUERY_REQUEST3</a> structure that contains the query request information.
 * 
 * <div class="alert"><b>Note</b>  By omitting the <a href="https://docs.microsoft.com/windows/desktop/api/windns/nc-windns-dns_query_completion_routine">DNS_QUERY_COMPLETION_ROUTINE</a> callback from the <b>pQueryCompleteCallback</b> member of this structure, <b>DnsQueryEx</b> is called synchronously.</div>
 * <div> </div>
 * @param {Pointer<DNS_QUERY_RESULT>} pQueryResults A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windns/ns-windns-dns_query_result">DNS_QUERY_RESULT</a> structure that contains the results of the query. On input, the <b>version</b> member of  <i>pQueryResults</i> must be <b>DNS_QUERY_RESULTS_VERSION1</b> and all other members should be <b>NULL</b>. On output, the remaining members will be filled as part of the query complete. 
 * 
 * <div class="alert"><b>Note</b>  For asynchronous queries, an application should not free
 *                             this structure until the <a href="https://docs.microsoft.com/windows/desktop/api/windns/nc-windns-dns_query_completion_routine">DNS_QUERY_COMPLETION_ROUTINE</a> callback is invoked. When the query completes, the <a href="https://docs.microsoft.com/windows/desktop/api/windns/ns-windns-dns_query_result">DNS_QUERY_RESULT</a> structure contains a pointer to a list of
 *                             <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORDS</a> that should be freed using <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsrecordlistfree">DnsRecordListFree</a>.</div>
 * <div> </div>
 * @param {Pointer<DNS_QUERY_CANCEL>} pCancelHandle A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windns/ns-windns-dns_query_cancel">DNS_QUERY_CANCEL</a> structure that can be used to cancel a
 *                             pending asynchronous query.
 * 
 * <div class="alert"><b>Note</b>  An application should not free
 *                             this structure until the <a href="https://docs.microsoft.com/windows/desktop/api/windns/nc-windns-dns_query_completion_routine">DNS_QUERY_COMPLETION_ROUTINE</a> callback is invoked.</div>
 * <div> </div>
 * @returns {Integer} The 
 * <b>DnsQueryEx</b> function has the following possible return values:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The call was successful.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Either the <i>pQueryRequest</i> or <i>pQueryRequest</i> parameters are uninitialized or contain the wrong version. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>DNS RCODE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The call resulted in an <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">RCODE</a> error.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>DNS_INFO_NO_RECORDS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No records in the response.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>DNS_REQUEST_PENDING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The query will be completed asynchronously.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsqueryex
 * @since windows8.0
 */
export DnsQueryEx(pQueryRequest, pQueryResults, pCancelHandle) {
    result := DllCall("DNSAPI.dll\DnsQueryEx", DNS_QUERY_REQUEST.Ptr, pQueryRequest, DNS_QUERY_RESULT.Ptr, pQueryResults, DNS_QUERY_CANCEL.Ptr, pCancelHandle, Int32)
    return result
}

/**
 * The DnsCancelQuery function can be used to cancel a pending query to the DNS namespace.
 * @remarks
 * <b>DnsCancelQuery</b> does not wait for a query to complete before cancelling. Therefore,
 *     applications should track pending queries through their <a href="https://docs.microsoft.com/windows/desktop/api/windns/nc-windns-dns_query_completion_routine">DNS_QUERY_COMPLETION_ROUTINE</a> DNS callbacks.
 * 
 * <i>pCancelHandle</i> is valid until the <a href="https://docs.microsoft.com/windows/desktop/api/windns/nc-windns-dns_query_completion_routine">DNS_QUERY_COMPLETION_ROUTINE</a> DNS callback is invoked and <b>DnsCancelQuery</b> completes.
 * @param {Pointer<DNS_QUERY_CANCEL>} pCancelHandle A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windns/ns-windns-dns_query_cancel">DNS_QUERY_CANCEL</a> structure used to cancel an asynchronous DNS query. The structure must have been returned in the <i>pCancelHandle</i> parameter of a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsqueryex">DnsQueryEx</a>.
 * @returns {Integer} Returns success confirmation upon successful completion. Otherwise, it returns the appropriate DNS-specific error code as defined in Winerror.h.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnscancelquery
 * @since windows8.0
 */
export DnsCancelQuery(pCancelHandle) {
    result := DllCall("DNSAPI.dll\DnsCancelQuery", DNS_QUERY_CANCEL.Ptr, pCancelHandle, Int32)
    return result
}

/**
 * 
 * @param {Pointer<DNS_QUERY_RAW_RESULT>} queryResults 
 * @returns {String} Nothing - always returns an empty string
 */
export DnsQueryRawResultFree(queryResults) {
    DllCall("DNSAPI.dll\DnsQueryRawResultFree", DNS_QUERY_RAW_RESULT.Ptr, queryResults)
}

/**
 * 
 * @param {Pointer<DNS_QUERY_RAW_REQUEST>} queryRequest 
 * @param {Pointer<DNS_QUERY_RAW_CANCEL>} cancelHandle 
 * @returns {Integer} 
 */
export DnsQueryRaw(queryRequest, cancelHandle) {
    result := DllCall("DNSAPI.dll\DnsQueryRaw", DNS_QUERY_RAW_REQUEST.Ptr, queryRequest, DNS_QUERY_RAW_CANCEL.Ptr, cancelHandle, Int32)
    return result
}

/**
 * 
 * @param {Pointer<DNS_QUERY_RAW_CANCEL>} cancelHandle 
 * @returns {Integer} 
 */
export DnsCancelQueryRaw(cancelHandle) {
    result := DllCall("DNSAPI.dll\DnsCancelQueryRaw", DNS_QUERY_RAW_CANCEL.Ptr, cancelHandle, Int32)
    return result
}

/**
 * The DnsAcquireContextHandle function type acquires a context handle to a set of credentials. (Unicode)
 * @param {Integer} CredentialFlags A flag that indicates the character encoding. Set to <b>TRUE</b> for Unicode, <b>FALSE</b> for ANSI.
 * @param {Pointer<Void>} Credentials A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY_W</a> structure or a <b>SEC_WINNT_AUTH_IDENTITY_A</b> structure that contains the name, domain, and password of the account to be used in a secure dynamic update. If <i>CredentialFlags</i> is set to <b>TRUE</b>, <i>Credentials</i> points to a <b>SEC_WINNT_AUTH_IDENTITY_W</b> structure; otherwise, <i>Credentials</i> points to a <b>SEC_WINNT_AUTH_IDENTITY_A</b> structure. If not specified, the credentials of the calling service are used. This parameter is optional.
 * @param {Pointer<HANDLE>} pContext A pointer to a handle pointing to the returned credentials.
 * @returns {Integer} Returns success confirmation upon successful completion. Otherwise, returns the appropriate DNS-specific error code as defined in Winerror.h.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsacquirecontexthandle_w
 * @since windows5.0
 */
export DnsAcquireContextHandle_W(CredentialFlags, Credentials, pContext) {
    CredentialsMarshal := Credentials is VarRef ? "ptr" : "ptr"

    result := DllCall("DNSAPI.dll\DnsAcquireContextHandle_W", "uint", CredentialFlags, CredentialsMarshal, Credentials, HANDLE.Ptr, pContext, Int32)
    return result
}

/**
 * The DnsAcquireContextHandle function type acquires a context handle to a set of credentials. (ANSI)
 * @param {Integer} CredentialFlags A flag that indicates the character encoding. Set to <b>TRUE</b> for Unicode, <b>FALSE</b> for ANSI.
 * @param {Pointer<Void>} Credentials A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY_W</a> structure or a <b>SEC_WINNT_AUTH_IDENTITY_A</b> structure that contains the name, domain, and password of the account to be used in a secure dynamic update. If <i>CredentialFlags</i> is set to <b>TRUE</b>, <i>Credentials</i> points to a <b>SEC_WINNT_AUTH_IDENTITY_W</b> structure; otherwise, <i>Credentials</i> points to a <b>SEC_WINNT_AUTH_IDENTITY_A</b> structure. If not specified, the credentials of the calling service are used. This parameter is optional.
 * @param {Pointer<HANDLE>} pContext A pointer to a handle pointing to the returned credentials.
 * @returns {Integer} Returns success confirmation upon successful completion. Otherwise, returns the appropriate DNS-specific error code as defined in Winerror.h.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsacquirecontexthandle_a
 * @since windows5.0
 */
export DnsAcquireContextHandle_A(CredentialFlags, Credentials, pContext) {
    CredentialsMarshal := Credentials is VarRef ? "ptr" : "ptr"

    result := DllCall("DNSAPI.dll\DnsAcquireContextHandle_A", "uint", CredentialFlags, CredentialsMarshal, Credentials, HANDLE.Ptr, pContext, Int32)
    return result
}

/**
 * The DnsReleaseContextHandle function releases memory used to store the credentials of a specific account.
 * @param {HANDLE} hContext The credentials handle of a specific account.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsreleasecontexthandle
 * @since windows5.0
 */
export DnsReleaseContextHandle(hContext) {
    DllCall("DNSAPI.dll\DnsReleaseContextHandle", HANDLE, hContext)
}

/**
 * Function adds, modifies or removes a Resource Record (RR) set that may have been previously registered with DNS servers. (DnsModifyRecordsInSet_W)
 * @remarks
 * The 
 * <b>DnsModifyRecordsInSet</b> function type executes in the following steps.
 * 
 * <ol>
 * <li>Records specified in <i>pDeleteRecords</i> are deleted. If <i>pDeleteRecords</i> is empty or does not contain records that exist in the current set, the <b>DnsModifyRecordsInSet</b> function goes to the next step.</li>
 * <li>Records specified in <i>pAddRecords</i> are added. If <i>pAddRecords</i> is empty, the operation completes without adding any records.</li>
 * </ol>
 * To add a new record, provide no records in <i>pDeleteRecords</i>, and provide the record to be added in <i>pAddRecords</i>.  To modify a record, specify the record being modified in <i>pDeleteRecords</i>, then add the modified version of that record by placing it in <i>pAddRecords</i>. To delete records, specify only records to be deleted.  Multiple records can be added or deleted in a single call to <b>DnsModifyRecordsInSet</b>; however, the value of the <b>pName</b> member in each <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> must be the same or the call will fail. If a record specified in <i>pAddRecords</i> is already present, no change occurs.
 * 
 * If no server list is specified, the default name server is queried.
 * @param {Pointer<DNS_RECORDA>} pAddRecords A pointer to the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the RRs to be added to the RR set.
 * @param {Pointer<DNS_RECORDA>} pDeleteRecords A pointer to the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the RRs to be deleted from the RR set.
 * @param {Integer} Options A value that contains a bitmap of <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Update  Options</a>. Options can be combined and all options override <b>DNS_UPDATE_SECURITY_USE_DEFAULT</b>.
 * @param {HANDLE} hCredentials A handle to the credentials of a specific account. Used when secure dynamic update is required. This parameter is optional.
 * @param {Pointer<Void>} pExtraList This parameter is reserved for future use and must be set to <b>NULL</b>.
 * @param {Pointer<Void>} pReserved This parameter is reserved for future use and must be set to <b>NULL</b>.
 * @returns {Integer} Returns success confirmation upon successful completion. Otherwise, it returns the appropriate DNS-specific error code as defined in Winerror.h.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsmodifyrecordsinset_w
 * @since windows5.0
 */
export DnsModifyRecordsInSet_W(pAddRecords, pDeleteRecords, Options, hCredentials, pExtraList, pReserved) {
    pExtraListMarshal := pExtraList is VarRef ? "ptr" : "ptr"
    pReservedMarshal := pReserved is VarRef ? "ptr" : "ptr"

    result := DllCall("DNSAPI.dll\DnsModifyRecordsInSet_W", DNS_RECORDA.Ptr, pAddRecords, DNS_RECORDA.Ptr, pDeleteRecords, "uint", Options, HANDLE, hCredentials, pExtraListMarshal, pExtraList, pReservedMarshal, pReserved, Int32)
    return result
}

/**
 * Function adds, modifies or removes a Resource Record (RR) set that may have been previously registered with DNS servers. (DnsModifyRecordsInSet_A)
 * @remarks
 * The 
 * <b>DnsModifyRecordsInSet</b> function type executes in the following steps.
 * 
 * <ol>
 * <li>Records specified in <i>pDeleteRecords</i> are deleted. If <i>pDeleteRecords</i> is empty or does not contain records that exist in the current set, the <b>DnsModifyRecordsInSet</b> function goes to the next step.</li>
 * <li>Records specified in <i>pAddRecords</i> are added. If <i>pAddRecords</i> is empty, the operation completes without adding any records.</li>
 * </ol>
 * To add a new record, provide no records in <i>pDeleteRecords</i>, and provide the record to be added in <i>pAddRecords</i>.  To modify a record, specify the record being modified in <i>pDeleteRecords</i>, then add the modified version of that record by placing it in <i>pAddRecords</i>. To delete records, specify only records to be deleted.  Multiple records can be added or deleted in a single call to <b>DnsModifyRecordsInSet</b>; however, the value of the <b>pName</b> member in each <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> must be the same or the call will fail. If a record specified in <i>pAddRecords</i> is already present, no change occurs.
 * 
 * If no server list is specified, the default name server is queried.
 * @param {Pointer<DNS_RECORDA>} pAddRecords A pointer to the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the RRs to be added to the RR set.
 * @param {Pointer<DNS_RECORDA>} pDeleteRecords A pointer to the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the RRs to be deleted from the RR set.
 * @param {Integer} Options A value that contains a bitmap of <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Update  Options</a>. Options can be combined and all options override <b>DNS_UPDATE_SECURITY_USE_DEFAULT</b>.
 * @param {HANDLE} hCredentials A handle to the credentials of a specific account. Used when secure dynamic update is required. This parameter is optional.
 * @param {Pointer<Void>} pExtraList This parameter is reserved for future use and must be set to <b>NULL</b>.
 * @param {Pointer<Void>} pReserved This parameter is reserved for future use and must be set to <b>NULL</b>.
 * @returns {Integer} Returns success confirmation upon successful completion. Otherwise, it returns the appropriate DNS-specific error code as defined in Winerror.h.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsmodifyrecordsinset_a
 * @since windows5.0
 */
export DnsModifyRecordsInSet_A(pAddRecords, pDeleteRecords, Options, hCredentials, pExtraList, pReserved) {
    pExtraListMarshal := pExtraList is VarRef ? "ptr" : "ptr"
    pReservedMarshal := pReserved is VarRef ? "ptr" : "ptr"

    result := DllCall("DNSAPI.dll\DnsModifyRecordsInSet_A", DNS_RECORDA.Ptr, pAddRecords, DNS_RECORDA.Ptr, pDeleteRecords, "uint", Options, HANDLE, hCredentials, pExtraListMarshal, pExtraList, pReservedMarshal, pReserved, Int32)
    return result
}

/**
 * Function adds, modifies or removes a Resource Record (RR) set that may have been previously registered with DNS servers. (DnsModifyRecordsInSet_UTF8)
 * @remarks
 * The 
 * <b>DnsModifyRecordsInSet</b> function type executes in the following steps.
 * 
 * <ol>
 * <li>Records specified in <i>pDeleteRecords</i> are deleted. If <i>pDeleteRecords</i> is empty or does not contain records that exist in the current set, the <b>DnsModifyRecordsInSet</b> function goes to the next step.</li>
 * <li>Records specified in <i>pAddRecords</i> are added. If <i>pAddRecords</i> is empty, the operation completes without adding any records.</li>
 * </ol>
 * To add a new record, provide no records in <i>pDeleteRecords</i>, and provide the record to be added in <i>pAddRecords</i>.  To modify a record, specify the record being modified in <i>pDeleteRecords</i>, then add the modified version of that record by placing it in <i>pAddRecords</i>. To delete records, specify only records to be deleted.  Multiple records can be added or deleted in a single call to <b>DnsModifyRecordsInSet</b>; however, the value of the <b>pName</b> member in each <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> must be the same or the call will fail. If a record specified in <i>pAddRecords</i> is already present, no change occurs.
 * 
 * If no server list is specified, the default name server is queried.
 * @param {Pointer<DNS_RECORDA>} pAddRecords A pointer to the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the RRs to be added to the RR set.
 * @param {Pointer<DNS_RECORDA>} pDeleteRecords A pointer to the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the RRs to be deleted from the RR set.
 * @param {Integer} Options A value that contains a bitmap of <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Update  Options</a>. Options can be combined and all options override <b>DNS_UPDATE_SECURITY_USE_DEFAULT</b>.
 * @param {HANDLE} hCredentials A handle to the credentials of a specific account. Used when secure dynamic update is required. This parameter is optional.
 * @param {Pointer<Void>} pExtraList This parameter is reserved for future use and must be set to <b>NULL</b>.
 * @param {Pointer<Void>} pReserved This parameter is reserved for future use and must be set to <b>NULL</b>.
 * @returns {Integer} Returns success confirmation upon successful completion. Otherwise, it returns the appropriate DNS-specific error code as defined in Winerror.h.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsmodifyrecordsinset_utf8
 * @since windows5.0
 */
export DnsModifyRecordsInSet_UTF8(pAddRecords, pDeleteRecords, Options, hCredentials, pExtraList, pReserved) {
    pExtraListMarshal := pExtraList is VarRef ? "ptr" : "ptr"
    pReservedMarshal := pReserved is VarRef ? "ptr" : "ptr"

    result := DllCall("DNSAPI.dll\DnsModifyRecordsInSet_UTF8", DNS_RECORDA.Ptr, pAddRecords, DNS_RECORDA.Ptr, pDeleteRecords, "uint", Options, HANDLE, hCredentials, pExtraListMarshal, pExtraList, pReservedMarshal, pReserved, Int32)
    return result
}

/**
 * Replaces an existing resource record (RR) set. (DnsReplaceRecordSetW)
 * @remarks
 * > [!NOTE]
 * > The windns.h header defines DnsReplaceRecordSet as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<DNS_RECORDA>} pReplaceSet A pointer to a 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the RR set that replaces the existing set. The specified RR set is replaced with the contents of <i>pNewSet</i>. To delete a RR set, specify the set in <i>pNewSet</i>, but set <i>RDATA</i> to <b>NULL</b>.
 * @param {Integer} Options A value that contains a bitmap of <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Update  Options</a>. Options can be combined and all options override <b>DNS_UPDATE_SECURITY_USE_DEFAULT</b>.
 * @param {HANDLE} hContext The handle to the credentials of a specific account. Used when secure dynamic update is required. This parameter is optional.
 * @param {Pointer<Void>} pExtraInfo This parameter is reserved for future use and must be set to <b>NULL</b>.
 * @param {Pointer<Void>} pReserved This parameter is reserved for future use and must be set to <b>NULL</b>.
 * @returns {Integer} Returns success confirmation upon successful completion. Otherwise, returns the appropriate DNS-specific error code as defined in Winerror.h.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsreplacerecordsetw
 * @since windows5.0
 */
export DnsReplaceRecordSetW(pReplaceSet, Options, hContext, pExtraInfo, pReserved) {
    pExtraInfoMarshal := pExtraInfo is VarRef ? "ptr" : "ptr"
    pReservedMarshal := pReserved is VarRef ? "ptr" : "ptr"

    result := DllCall("DNSAPI.dll\DnsReplaceRecordSetW", DNS_RECORDA.Ptr, pReplaceSet, "uint", Options, HANDLE, hContext, pExtraInfoMarshal, pExtraInfo, pReservedMarshal, pReserved, Int32)
    return result
}

/**
 * Replaces an existing resource record (RR) set. (DnsReplaceRecordSetA)
 * @remarks
 * > [!NOTE]
 * > The windns.h header defines DnsReplaceRecordSet as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<DNS_RECORDA>} pReplaceSet A pointer to a 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the RR set that replaces the existing set. The specified RR set is replaced with the contents of <i>pNewSet</i>. To delete a RR set, specify the set in <i>pNewSet</i>, but set <i>RDATA</i> to <b>NULL</b>.
 * @param {Integer} Options A value that contains a bitmap of <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Update  Options</a>. Options can be combined and all options override <b>DNS_UPDATE_SECURITY_USE_DEFAULT</b>.
 * @param {HANDLE} hContext The handle to the credentials of a specific account. Used when secure dynamic update is required. This parameter is optional.
 * @param {Pointer<Void>} pExtraInfo This parameter is reserved for future use and must be set to <b>NULL</b>.
 * @param {Pointer<Void>} pReserved This parameter is reserved for future use and must be set to <b>NULL</b>.
 * @returns {Integer} Returns success confirmation upon successful completion. Otherwise, returns the appropriate DNS-specific error code as defined in Winerror.h.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsreplacerecordseta
 * @since windows5.0
 */
export DnsReplaceRecordSetA(pReplaceSet, Options, hContext, pExtraInfo, pReserved) {
    pExtraInfoMarshal := pExtraInfo is VarRef ? "ptr" : "ptr"
    pReservedMarshal := pReserved is VarRef ? "ptr" : "ptr"

    result := DllCall("DNSAPI.dll\DnsReplaceRecordSetA", DNS_RECORDA.Ptr, pReplaceSet, "uint", Options, HANDLE, hContext, pExtraInfoMarshal, pExtraInfo, pReservedMarshal, pReserved, Int32)
    return result
}

/**
 * Replaces an existing resource record (RR) set. (DnsReplaceRecordSetUTF8)
 * @param {Pointer<DNS_RECORDA>} pReplaceSet A pointer to a 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the RR set that replaces the existing set. The specified RR set is replaced with the contents of <i>pNewSet</i>. To delete a RR set, specify the set in <i>pNewSet</i>, but set <i>RDATA</i> to <b>NULL</b>.
 * @param {Integer} Options A value that contains a bitmap of <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Update  Options</a>. Options can be combined and all options override <b>DNS_UPDATE_SECURITY_USE_DEFAULT</b>.
 * @param {HANDLE} hContext The handle to the credentials of a specific account. Used when secure dynamic update is required. This parameter is optional.
 * @param {Pointer<Void>} pExtraInfo This parameter is reserved for future use and must be set to <b>NULL</b>.
 * @param {Pointer<Void>} pReserved This parameter is reserved for future use and must be set to <b>NULL</b>.
 * @returns {Integer} Returns success confirmation upon successful completion. Otherwise, returns the appropriate DNS-specific error code as defined in Winerror.h.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsreplacerecordsetutf8
 * @since windows5.0
 */
export DnsReplaceRecordSetUTF8(pReplaceSet, Options, hContext, pExtraInfo, pReserved) {
    pExtraInfoMarshal := pExtraInfo is VarRef ? "ptr" : "ptr"
    pReservedMarshal := pReserved is VarRef ? "ptr" : "ptr"

    result := DllCall("DNSAPI.dll\DnsReplaceRecordSetUTF8", DNS_RECORDA.Ptr, pReplaceSet, "uint", Options, HANDLE, hContext, pExtraInfoMarshal, pExtraInfo, pReservedMarshal, pReserved, Int32)
    return result
}

/**
 * The DnsValidateName function validates the status of a specified DNS name. (DnsValidateName_W)
 * @remarks
 * To verify the status of the Computer Host (single label), use the 
 * <b>DnsValidateName</b> function type with <b>DnsNameHostnameLabel</b> in <i>Format</i>.
 * 
 * The 
 * <b>DnsValidateName</b> function works in a progression when determining whether an error exists with a given DNS name, and returns upon finding its first error. Therefore, a DNS name that has multiple, different errors may be reported as having the first error, and could be corrected and resubmitted, only then to find the second error.
 * 
 * The 
 * <b>DnsValidateName</b> function searches for errors as follows:
 * 
 * <ol>
 * <li>Returns <b>ERROR_INVALID_NAME</b> if the DNS name:
 * 						<ul>
 * <li>Is longer than 255 octets.</li>
 * <li>Contains a label longer than 63 octets.</li>
 * <li>Contains two or more consecutive dots.</li>
 * <li>Begins with a dot (.).</li>
 * <li>Contains a dot (.) if the name is submitted with <i>Format</i> set to DnsNameDomainLabel or DnsNameHostnameLabel.</li>
 * </ul>
 * </li>
 * <li>Next, 
 * <b>DnsValidateName</b> returns <b>DNS_ERROR_NUMERIC_NAME</b> if the full DNS name consists of only  numeric characters (0-9) or the first label of the DNS name consists of only numeric characters (0-9), unless <i>Format</i> is set to DnsNameDomainLabel or DnsNameDomain.</li>
 * <li>Then, 
 * <b>DnsValidateName</b> returns DNS_ERROR_NON_RFC_NAME if the DNS name:
 * 						<ul>
 * <li>Contains at least one extended or Unicode character.<b>Note</b>  Windows 8 or later: <b>DnsValidateName_W</b> does not return an error if International Domain Name (IDN) encoding is enabled.
 * 
 * </li>
 * <li>Contains underscore (_), unless the underscore is a first character in a label, in the name, submitted with <i>Format</i> set to DnsNameSrvRecord.</li>
 * </ul>
 * </li>
 * <li>Next, 
 * <b>DnsValidateName</b> returns <b>DNS_ERROR_INVALID_NAME_CHAR</b> if the DNS name:
 * 						<ul>
 * <li>Contains a space.</li>
 * <li>Contains any of the following invalid characters: { | } ~ [ \ ] ^ ' : ; &lt; = &gt; ? &amp; @ ! " # $ % ^ ` ( ) + / ,</li>
 * <li>Contains an asterisk (*), unless the asterisk is the first label in the multi-labeled name, submitted with <i>Format</i> set to <b>DnsNameWildcard</b>.</li>
 * </ul>
 * </li>
 * </ol>
 * <div class="alert"><b>Note</b>  If 
 * <b>DnsValidateName</b> returns <b>DNS_ERROR_NON_RFC_NAME</b>, the error should be handled as a warning that not all DNS servers will accept the name. When this error is received, note that the DNS Server does accept the submitted name, if appropriately configured (default configuration accepts the name as submitted when <b>DNS_ERROR_NON_RFC_NAME</b> is returned), but other DNS server software may not. Windows DNS servers do handle <b>NON_RFC_NAMES</b>.<p class="note">If 
 * <b>DnsValidateName</b> returns any of the following errors, <i>pszName</i> should be handled as an invalid host name:
 * 
 * <dl>
 * <dd>DNS_ERROR_NUMERIC_NAME</dd>
 * <dd>DNS_ERROR_INVALID_NAME_CHAR</dd>
 * <dd>ERROR_INVALID_NAME</dd>
 * </dl>
 * </div>
 * <div> </div>
 * @param {PWSTR} pszName A pointer to a string that represents the DNS name to be examined.
 * @param {DNS_NAME_FORMAT} Format A <a href="https://docs.microsoft.com/windows/desktop/api/windns/ne-windns-dns_name_format">DNS_NAME_FORMAT</a> value that specifies the format of the name to be examined.
 * @returns {Integer} The 
 * <b>DnsValidateName</b> function has the following possible return values:
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsvalidatename_w
 * @since windows5.0
 */
export DnsValidateName_W(pszName, Format) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    result := DllCall("DNSAPI.dll\DnsValidateName_W", "ptr", pszName, DNS_NAME_FORMAT, Format, Int32)
    return result
}

/**
 * The DnsValidateName function validates the status of a specified DNS name. (DnsValidateName_A)
 * @remarks
 * To verify the status of the Computer Host (single label), use the 
 * <b>DnsValidateName</b> function type with <b>DnsNameHostnameLabel</b> in <i>Format</i>.
 * 
 * The 
 * <b>DnsValidateName</b> function works in a progression when determining whether an error exists with a given DNS name, and returns upon finding its first error. Therefore, a DNS name that has multiple, different errors may be reported as having the first error, and could be corrected and resubmitted, only then to find the second error.
 * 
 * The 
 * <b>DnsValidateName</b> function searches for errors as follows:
 * 
 * <ol>
 * <li>Returns <b>ERROR_INVALID_NAME</b> if the DNS name:
 * 						<ul>
 * <li>Is longer than 255 octets.</li>
 * <li>Contains a label longer than 63 octets.</li>
 * <li>Contains two or more consecutive dots.</li>
 * <li>Begins with a dot (.).</li>
 * <li>Contains a dot (.) if the name is submitted with <i>Format</i> set to DnsNameDomainLabel or DnsNameHostnameLabel.</li>
 * </ul>
 * </li>
 * <li>Next, 
 * <b>DnsValidateName</b> returns <b>DNS_ERROR_NUMERIC_NAME</b> if the full DNS name consists of only  numeric characters (0-9) or the first label of the DNS name consists of only numeric characters (0-9), unless <i>Format</i> is set to DnsNameDomainLabel or DnsNameDomain.</li>
 * <li>Then, 
 * <b>DnsValidateName</b> returns DNS_ERROR_NON_RFC_NAME if the DNS name:
 * 						<ul>
 * <li>Contains at least one extended or Unicode character.<b>Note</b>  Windows 8 or later: <b>DnsValidateName_W</b> does not return an error if International Domain Name (IDN) encoding is enabled.
 * 
 * </li>
 * <li>Contains underscore (_), unless the underscore is a first character in a label, in the name, submitted with <i>Format</i> set to DnsNameSrvRecord.</li>
 * </ul>
 * </li>
 * <li>Next, 
 * <b>DnsValidateName</b> returns <b>DNS_ERROR_INVALID_NAME_CHAR</b> if the DNS name:
 * 						<ul>
 * <li>Contains a space.</li>
 * <li>Contains any of the following invalid characters: { | } ~ [ \ ] ^ ' : ; &lt; = &gt; ? &amp; @ ! " # $ % ^ ` ( ) + / ,</li>
 * <li>Contains an asterisk (*), unless the asterisk is the first label in the multi-labeled name, submitted with <i>Format</i> set to <b>DnsNameWildcard</b>.</li>
 * </ul>
 * </li>
 * </ol>
 * <div class="alert"><b>Note</b>  If 
 * <b>DnsValidateName</b> returns <b>DNS_ERROR_NON_RFC_NAME</b>, the error should be handled as a warning that not all DNS servers will accept the name. When this error is received, note that the DNS Server does accept the submitted name, if appropriately configured (default configuration accepts the name as submitted when <b>DNS_ERROR_NON_RFC_NAME</b> is returned), but other DNS server software may not. Windows DNS servers do handle <b>NON_RFC_NAMES</b>.<p class="note">If 
 * <b>DnsValidateName</b> returns any of the following errors, <i>pszName</i> should be handled as an invalid host name:
 * 
 * <dl>
 * <dd>DNS_ERROR_NUMERIC_NAME</dd>
 * <dd>DNS_ERROR_INVALID_NAME_CHAR</dd>
 * <dd>ERROR_INVALID_NAME</dd>
 * </dl>
 * </div>
 * <div> </div>
 * @param {PSTR} pszName A pointer to a string that represents the DNS name to be examined.
 * @param {DNS_NAME_FORMAT} Format A <a href="https://docs.microsoft.com/windows/desktop/api/windns/ne-windns-dns_name_format">DNS_NAME_FORMAT</a> value that specifies the format of the name to be examined.
 * @returns {Integer} The 
 * <b>DnsValidateName</b> function has the following possible return values:
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsvalidatename_a
 * @since windows5.0
 */
export DnsValidateName_A(pszName, Format) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    result := DllCall("DNSAPI.dll\DnsValidateName_A", "ptr", pszName, DNS_NAME_FORMAT, Format, Int32)
    return result
}

/**
 * The DnsValidateName_UTF8 function (windns.h) function validates the status of a specified DNS name.
 * @remarks
 * To verify the status of the Computer Host (single label), use the 
 * <b>DnsValidateName</b> function type with <b>DnsNameHostnameLabel</b> in <i>Format</i>.
 * 
 * The 
 * <b>DnsValidateName</b> function works in a progression when determining whether an error exists with a given DNS name, and returns upon finding its first error. Therefore, a DNS name that has multiple, different errors may be reported as having the first error, and could be corrected and resubmitted, only then to find the second error.
 * 
 * The 
 * <b>DnsValidateName</b> function searches for errors as follows:
 * 
 * <ol>
 * <li>Returns <b>ERROR_INVALID_NAME</b> if the DNS name:
 * 						<ul>
 * <li>Is longer than 255 octets.</li>
 * <li>Contains a label longer than 63 octets.</li>
 * <li>Contains two or more consecutive dots.</li>
 * <li>Begins with a dot (.).</li>
 * <li>Contains a dot (.) if the name is submitted with <i>Format</i> set to DnsNameDomainLabel or DnsNameHostnameLabel.</li>
 * </ul>
 * </li>
 * <li>Next, 
 * <b>DnsValidateName</b> returns <b>DNS_ERROR_NUMERIC_NAME</b> if the full DNS name consists of only  numeric characters (0-9) or the first label of the DNS name consists of only numeric characters (0-9), unless <i>Format</i> is set to DnsNameDomainLabel or DnsNameDomain.</li>
 * <li>Then, 
 * <b>DnsValidateName</b> returns DNS_ERROR_NON_RFC_NAME if the DNS name:
 * 						<ul>
 * <li>Contains at least one extended or Unicode character.<b>Note</b>  Windows 8 or later: <b>DnsValidateName_W</b> does not return an error if International Domain Name (IDN) encoding is enabled.
 * 
 * </li>
 * <li>Contains underscore (_), unless the underscore is a first character in a label, in the name, submitted with <i>Format</i> set to DnsNameSrvRecord.</li>
 * </ul>
 * </li>
 * <li>Next, 
 * <b>DnsValidateName</b> returns <b>DNS_ERROR_INVALID_NAME_CHAR</b> if the DNS name:
 * 						<ul>
 * <li>Contains a space.</li>
 * <li>Contains any of the following invalid characters: { | } ~ [ \ ] ^ ' : ; &lt; = &gt; ? &amp; @ ! " # $ % ^ ` ( ) + / ,</li>
 * <li>Contains an asterisk (*), unless the asterisk is the first label in the multi-labeled name, submitted with <i>Format</i> set to <b>DnsNameWildcard</b>.</li>
 * </ul>
 * </li>
 * </ol>
 * <div class="alert"><b>Note</b>  If 
 * <b>DnsValidateName</b> returns <b>DNS_ERROR_NON_RFC_NAME</b>, the error should be handled as a warning that not all DNS servers will accept the name. When this error is received, note that the DNS Server does accept the submitted name, if appropriately configured (default configuration accepts the name as submitted when <b>DNS_ERROR_NON_RFC_NAME</b> is returned), but other DNS server software may not. Windows DNS servers do handle <b>NON_RFC_NAMES</b>.<p class="note">If 
 * <b>DnsValidateName</b> returns any of the following errors, <i>pszName</i> should be handled as an invalid host name:
 * 
 * <dl>
 * <dd>DNS_ERROR_NUMERIC_NAME</dd>
 * <dd>DNS_ERROR_INVALID_NAME_CHAR</dd>
 * <dd>ERROR_INVALID_NAME</dd>
 * </dl>
 * </div>
 * <div> </div>
 * @param {PSTR} pszName A pointer to a string that represents the DNS name to be examined.
 * @param {DNS_NAME_FORMAT} Format A <a href="https://docs.microsoft.com/windows/desktop/api/windns/ne-windns-dns_name_format">DNS_NAME_FORMAT</a> value that specifies the format of the name to be examined.
 * @returns {Integer} The 
 * <b>DnsValidateName</b> function has the following possible return values:
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsvalidatename_utf8
 * @since windows5.0
 */
export DnsValidateName_UTF8(pszName, Format) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    result := DllCall("DNSAPI.dll\DnsValidateName_UTF8", "ptr", pszName, DNS_NAME_FORMAT, Format, Int32)
    return result
}

/**
 * The DnsNameCompare function compares two DNS names. (DnsNameCompare_A)
 * @remarks
 * Name comparisons are not case sensitive, and trailing dots are ignored.
 * 
 * As with other DNS comparison functions, the 
 * <b>DnsNameCompare</b> function deems different encoding as an immediate indication of differing values, and as such, the same names with different characters encoding will not be reported identically.
 * @param {PSTR} pName1 A pointer to a string that represents the first DNS name of the comparison pair.
 * @param {PSTR} pName2 A pointer to a string that represents the second DNS name of the comparison pair.
 * @returns {BOOL} Returns <b>TRUE</b> if the compared names are equivalent, <b>FALSE</b> if they are not.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsnamecompare_a
 * @since windows5.0
 */
export DnsNameCompare_A(pName1, pName2) {
    pName1 := pName1 is String ? StrPtr(pName1) : pName1
    pName2 := pName2 is String ? StrPtr(pName2) : pName2

    result := DllCall("DNSAPI.dll\DnsNameCompare_A", "ptr", pName1, "ptr", pName2, BOOL)
    return result
}

/**
 * The DnsNameCompare function compares two DNS names. (DnsNameCompare_W)
 * @remarks
 * Name comparisons are not case sensitive, and trailing dots are ignored.
 * 
 * As with other DNS comparison functions, the 
 * <b>DnsNameCompare</b> function deems different encoding as an immediate indication of differing values, and as such, the same names with different characters encoding will not be reported identically.
 * @param {PWSTR} pName1 A pointer to a string that represents the first DNS name of the comparison pair.
 * @param {PWSTR} pName2 A pointer to a string that represents the second DNS name of the comparison pair.
 * @returns {BOOL} Returns <b>TRUE</b> if the compared names are equivalent, <b>FALSE</b> if they are not.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsnamecompare_w
 * @since windows5.0
 */
export DnsNameCompare_W(pName1, pName2) {
    pName1 := pName1 is String ? StrPtr(pName1) : pName1
    pName2 := pName2 is String ? StrPtr(pName2) : pName2

    result := DllCall("DNSAPI.dll\DnsNameCompare_W", "ptr", pName1, "ptr", pName2, BOOL)
    return result
}

/**
 * The DnsWriteQuestionToBuffer function type creates a DNS query message and stores it in a DNS_MESSAGE_BUFFER structure. (DnsWriteQuestionToBuffer_W)
 * @remarks
 * The following declaration for <b>DnsWriteQuestionToBuffer_UTF8</b> can be found in Windns.h.
 * 
 * 
 * ``` syntax
 * BOOL
 * WINAPI
 * DnsWriteQuestionToBuffer_UTF8(
 *     __inout     PDNS_MESSAGE_BUFFER pDnsBuffer,
 *     __inout     PDWORD              pdwBufferSize,
 *     __in        PCSTR               pszName,
 *     __in        WORD                wType,
 *     __in        WORD                Xid,
 *     __in        BOOL                fRecursionDesired
 *     );
 * ```
 * @param {Pointer<DNS_MESSAGE_BUFFER>} pDnsBuffer A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windns/ns-windns-dns_message_buffer">DNS_MESSAGE_BUFFER</a> structure that contains a DNS query message stored in a buffer.
 * @param {Pointer<Integer>} pdwBufferSize The size, in bytes, of the buffer allocated to store <i>pDnsBuffer</i>. If the buffer size is insufficient to contain the message, <b>FALSE</b> is returned and <i>pdwBufferSize</i> contains the minimum required buffer size.
 * @param {PWSTR} pszName A pointer to a string that represents the name of the owner of the record set being queried.
 * @param {Integer} wType A value that represents the RR <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Record Type</a>. <b>wType</b> determines the format of <b>Data</b>. For example, if the value of <b>wType</b> is <b>DNS_TYPE_A</b>, the data type of <b>Data</b> is <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_a_data">DNS_A_DATA</a>.
 * @param {Integer} _Xid A value that specifies the unique DNS query identifier.
 * @param {BOOL} fRecursionDesired A BOOL that specifies whether recursive name query should be used  by the DNS name server. Set to <b>TRUE</b> to request recursive name query, <b>FALSE</b> to request iterative name query.
 * @returns {BOOL} Returns <b>TRUE</b> upon successful execution, otherwise <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnswritequestiontobuffer_w
 * @since windows5.0
 */
export DnsWriteQuestionToBuffer_W(pDnsBuffer, pdwBufferSize, pszName, wType, _Xid, fRecursionDesired) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    pdwBufferSizeMarshal := pdwBufferSize is VarRef ? "uint*" : "ptr"

    result := DllCall("DNSAPI.dll\DnsWriteQuestionToBuffer_W", DNS_MESSAGE_BUFFER.Ptr, pDnsBuffer, pdwBufferSizeMarshal, pdwBufferSize, "ptr", pszName, "ushort", wType, "ushort", _Xid, BOOL, fRecursionDesired, BOOL)
    return result
}

/**
 * The DnsWriteQuestionToBuffer function type creates a DNS query message and stores it in a DNS_MESSAGE_BUFFER structure. (DnsWriteQuestionToBuffer_UTF8)
 * @remarks
 * The following declaration for <b>DnsWriteQuestionToBuffer_UTF8</b> can be found in Windns.h.
 * 
 * 
 * ``` syntax
 * BOOL
 * WINAPI
 * DnsWriteQuestionToBuffer_UTF8(
 *     __inout     PDNS_MESSAGE_BUFFER pDnsBuffer,
 *     __inout     PDWORD              pdwBufferSize,
 *     __in        PCSTR               pszName,
 *     __in        WORD                wType,
 *     __in        WORD                Xid,
 *     __in        BOOL                fRecursionDesired
 *     );
 * ```
 * @param {Pointer<DNS_MESSAGE_BUFFER>} pDnsBuffer A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windns/ns-windns-dns_message_buffer">DNS_MESSAGE_BUFFER</a> structure that contains a DNS query message stored in a buffer.
 * @param {Pointer<Integer>} pdwBufferSize The size, in bytes, of the buffer allocated to store <i>pDnsBuffer</i>. If the buffer size is insufficient to contain the message, <b>FALSE</b> is returned and <i>pdwBufferSize</i> contains the minimum required buffer size.
 * @param {PSTR} pszName A pointer to a string that represents the name of the owner of the record set being queried.
 * @param {Integer} wType A value that represents the RR <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Record Type</a>. <b>wType</b> determines the format of <b>Data</b>. For example, if the value of <b>wType</b> is <b>DNS_TYPE_A</b>, the data type of <b>Data</b> is <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_a_data">DNS_A_DATA</a>.
 * @param {Integer} _Xid A value that specifies the unique DNS query identifier.
 * @param {BOOL} fRecursionDesired A BOOL that specifies whether recursive name query should be used  by the DNS name server. Set to <b>TRUE</b> to request recursive name query, <b>FALSE</b> to request iterative name query.
 * @returns {BOOL} Returns <b>TRUE</b> upon successful execution, otherwise <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnswritequestiontobuffer_utf8
 * @since windows5.0
 */
export DnsWriteQuestionToBuffer_UTF8(pDnsBuffer, pdwBufferSize, pszName, wType, _Xid, fRecursionDesired) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    pdwBufferSizeMarshal := pdwBufferSize is VarRef ? "uint*" : "ptr"

    result := DllCall("DNSAPI.dll\DnsWriteQuestionToBuffer_UTF8", DNS_MESSAGE_BUFFER.Ptr, pDnsBuffer, pdwBufferSizeMarshal, pdwBufferSize, "ptr", pszName, "ushort", wType, "ushort", _Xid, BOOL, fRecursionDesired, BOOL)
    return result
}

/**
 * The DnsExtractRecordsFromMessage function type extracts resource records (RR) from a DNS message, and stores those records in a DNS_RECORD structure. (DnsExtractRecordsFromMessage_W)
 * @remarks
 * The <b>DnsExtractRecordsFromMessage</b> function is designed to operate on messages in host byte order. As such, received messages should be converted from network byte order to host byte order before extraction, or before retransmission onto the network. Use the DNS_BYTE_FLIP_HEADER_COUNTS macro to change  byte ordering.
 * 
 * The following declaration for <b>DnsExtractRecordsFromMessage_UTF8</b> can be found in Windns.h.
 * 
 * 
 * ``` syntax
 * DNS_STATUS
 * WINAPI
 * DnsExtractRecordsFromMessage_UTF8(
 *     __in            PDNS_MESSAGE_BUFFER pDnsBuffer,
 *     __in            WORD                wMessageLength,
 *     __deref_out     PDNS_RECORD *       ppRecord
 *     );
 * 
 * ```
 * @param {Pointer<DNS_MESSAGE_BUFFER>} pDnsBuffer A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windns/ns-windns-dns_message_buffer">DNS_MESSAGE_BUFFER</a> structure that contains the DNS response message.
 * @param {Integer} wMessageLength The size, in bytes, of the message in 
 * <i>pDnsBuffer</i>.
 * @param {Pointer<Pointer<DNS_RECORDA>>} ppRecord A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the list of extracted RRs. To free these records, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsrecordlistfree">DnsRecordListFree</a> function.
 * @returns {Integer} Returns success confirmation upon successful completion. Otherwise, returns the appropriate DNS-specific error code as defined in Winerror.h.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsextractrecordsfrommessage_w
 * @since windows5.0
 */
export DnsExtractRecordsFromMessage_W(pDnsBuffer, wMessageLength, ppRecord) {
    ppRecordMarshal := ppRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("DNSAPI.dll\DnsExtractRecordsFromMessage_W", DNS_MESSAGE_BUFFER.Ptr, pDnsBuffer, "ushort", wMessageLength, ppRecordMarshal, ppRecord, Int32)
    return result
}

/**
 * The DnsExtractRecordsFromMessage function type extracts resource records (RR) from a DNS message, and stores those records in a DNS_RECORD structure. (DnsExtractRecordsFromMessage_UTF8)
 * @remarks
 * The <b>DnsExtractRecordsFromMessage</b> function is designed to operate on messages in host byte order. As such, received messages should be converted from network byte order to host byte order before extraction, or before retransmission onto the network. Use the DNS_BYTE_FLIP_HEADER_COUNTS macro to change  byte ordering.
 * 
 * The following declaration for <b>DnsExtractRecordsFromMessage_UTF8</b> can be found in Windns.h.
 * 
 * 
 * ``` syntax
 * DNS_STATUS
 * WINAPI
 * DnsExtractRecordsFromMessage_UTF8(
 *     __in            PDNS_MESSAGE_BUFFER pDnsBuffer,
 *     __in            WORD                wMessageLength,
 *     __deref_out     PDNS_RECORD *       ppRecord
 *     );
 * 
 * ```
 * @param {Pointer<DNS_MESSAGE_BUFFER>} pDnsBuffer A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windns/ns-windns-dns_message_buffer">DNS_MESSAGE_BUFFER</a> structure that contains the DNS response message.
 * @param {Integer} wMessageLength The size, in bytes, of the message in 
 * <i>pDnsBuffer</i>.
 * @param {Pointer<Pointer<DNS_RECORDA>>} ppRecord A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the list of extracted RRs. To free these records, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsrecordlistfree">DnsRecordListFree</a> function.
 * @returns {Integer} Returns success confirmation upon successful completion. Otherwise, returns the appropriate DNS-specific error code as defined in Winerror.h.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsextractrecordsfrommessage_utf8
 * @since windows5.0
 */
export DnsExtractRecordsFromMessage_UTF8(pDnsBuffer, wMessageLength, ppRecord) {
    ppRecordMarshal := ppRecord is VarRef ? "ptr*" : "ptr"

    result := DllCall("DNSAPI.dll\DnsExtractRecordsFromMessage_UTF8", DNS_MESSAGE_BUFFER.Ptr, pDnsBuffer, "ushort", wMessageLength, ppRecordMarshal, ppRecord, Int32)
    return result
}

/**
 * The DnsGetProxyInformation function returns the proxy information for a DNS server's name resolution policy table.
 * @param {PWSTR} hostName A pointer to a string that represents the name of the DNS server whose proxy information is returned.
 * @param {Pointer<DNS_PROXY_INFORMATION>} proxyInformation A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windns/ns-windns-dns_proxy_information">DNS_PROXY_INFORMATION</a> structure that contains the proxy information for <i>hostName</i>.
 * @param {Pointer<DNS_PROXY_INFORMATION>} defaultProxyInformation A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windns/ns-windns-dns_proxy_information">DNS_PROXY_INFORMATION</a> structure that contains the default proxy information for <i>hostName</i>. This proxy information is for the wildcard DNS policy.
 * @param {Pointer<DNS_PROXY_COMPLETION_ROUTINE>} completionRoutine Reserved. Do not use.
 * @param {Pointer<Void>} completionContext Reserved. Do not use.
 * @returns {Integer} The 
 * <b>DnsGetProxyInformation</b> function returns the appropriate DNS-specific error code as defined in Winerror.h. The following are possible return values:
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsgetproxyinformation
 * @since windows6.1
 */
export DnsGetProxyInformation(hostName, proxyInformation, defaultProxyInformation, completionRoutine, completionContext) {
    hostName := hostName is String ? StrPtr(hostName) : hostName

    completionContextMarshal := completionContext is VarRef ? "ptr" : "ptr"

    result := DllCall("DNSAPI.dll\DnsGetProxyInformation", "ptr", hostName, DNS_PROXY_INFORMATION.Ptr, proxyInformation, DNS_PROXY_INFORMATION.Ptr, defaultProxyInformation, "ptr", completionRoutine, completionContextMarshal, completionContext, UInt32)
    return result
}

/**
 * Frees memory allocated for the proxyName member of a DNS_PROXY_INFORMATION structure obtained using the DnsGetProxyInformation function.
 * @param {PWSTR} proxyName A pointer to the <b>proxyName</b> string to be freed.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsfreeproxyname
 * @since windows6.1
 */
export DnsFreeProxyName(proxyName) {
    proxyName := proxyName is String ? StrPtr(proxyName) : proxyName

    DllCall("DNSAPI.dll\DnsFreeProxyName", "ptr", proxyName)
}

/**
 * 
 * @param {PWSTR} pwszHostUrl 
 * @param {Pointer<Integer>} pSelectionContext 
 * @param {Integer} dwSelectionContextLength 
 * @param {Integer} dwExplicitInterfaceIndex 
 * @param {Pointer<DNS_CONNECTION_PROXY_INFO_EX>} pProxyInfoEx 
 * @returns {Integer} 
 */
export DnsConnectionGetProxyInfoForHostUrl(pwszHostUrl, pSelectionContext, dwSelectionContextLength, dwExplicitInterfaceIndex, pProxyInfoEx) {
    pwszHostUrl := pwszHostUrl is String ? StrPtr(pwszHostUrl) : pwszHostUrl

    pSelectionContextMarshal := pSelectionContext is VarRef ? "char*" : "ptr"

    result := DllCall("DNSAPI.dll\DnsConnectionGetProxyInfoForHostUrl", "ptr", pwszHostUrl, pSelectionContextMarshal, pSelectionContext, "uint", dwSelectionContextLength, "uint", dwExplicitInterfaceIndex, DNS_CONNECTION_PROXY_INFO_EX.Ptr, pProxyInfoEx, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} pwszHostUrl 
 * @param {Pointer<Integer>} pSelectionContext 
 * @param {Integer} dwSelectionContextLength 
 * @param {Integer} dwExplicitInterfaceIndex 
 * @param {PWSTR} pwszConnectionName 
 * @param {Pointer<DNS_CONNECTION_PROXY_INFO_EX>} pProxyInfoEx 
 * @returns {Integer} 
 */
export DnsConnectionGetProxyInfoForHostUrlEx(pwszHostUrl, pSelectionContext, dwSelectionContextLength, dwExplicitInterfaceIndex, pwszConnectionName, pProxyInfoEx) {
    pwszHostUrl := pwszHostUrl is String ? StrPtr(pwszHostUrl) : pwszHostUrl
    pwszConnectionName := pwszConnectionName is String ? StrPtr(pwszConnectionName) : pwszConnectionName

    pSelectionContextMarshal := pSelectionContext is VarRef ? "char*" : "ptr"

    result := DllCall("DNSAPI.dll\DnsConnectionGetProxyInfoForHostUrlEx", "ptr", pwszHostUrl, pSelectionContextMarshal, pSelectionContext, "uint", dwSelectionContextLength, "uint", dwExplicitInterfaceIndex, "ptr", pwszConnectionName, DNS_CONNECTION_PROXY_INFO_EX.Ptr, pProxyInfoEx, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<DNS_CONNECTION_PROXY_INFO_EX>} pProxyInfoEx 
 * @returns {String} Nothing - always returns an empty string
 */
export DnsConnectionFreeProxyInfoEx(pProxyInfoEx) {
    DllCall("DNSAPI.dll\DnsConnectionFreeProxyInfoEx", DNS_CONNECTION_PROXY_INFO_EX.Ptr, pProxyInfoEx)
}

/**
 * 
 * @param {PWSTR} pwszConnectionName 
 * @param {DNS_CONNECTION_PROXY_TYPE} Type 
 * @param {Pointer<DNS_CONNECTION_PROXY_INFO>} pProxyInfo 
 * @returns {Integer} 
 */
export DnsConnectionGetProxyInfo(pwszConnectionName, Type, pProxyInfo) {
    pwszConnectionName := pwszConnectionName is String ? StrPtr(pwszConnectionName) : pwszConnectionName

    result := DllCall("DNSAPI.dll\DnsConnectionGetProxyInfo", "ptr", pwszConnectionName, DNS_CONNECTION_PROXY_TYPE, Type, DNS_CONNECTION_PROXY_INFO.Ptr, pProxyInfo, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<DNS_CONNECTION_PROXY_INFO>} pProxyInfo 
 * @returns {String} Nothing - always returns an empty string
 */
export DnsConnectionFreeProxyInfo(pProxyInfo) {
    DllCall("DNSAPI.dll\DnsConnectionFreeProxyInfo", DNS_CONNECTION_PROXY_INFO.Ptr, pProxyInfo)
}

/**
 * 
 * @param {PWSTR} pwszConnectionName 
 * @param {DNS_CONNECTION_PROXY_TYPE} Type 
 * @param {Pointer<DNS_CONNECTION_PROXY_INFO>} pProxyInfo 
 * @returns {Integer} 
 */
export DnsConnectionSetProxyInfo(pwszConnectionName, Type, pProxyInfo) {
    pwszConnectionName := pwszConnectionName is String ? StrPtr(pwszConnectionName) : pwszConnectionName

    result := DllCall("DNSAPI.dll\DnsConnectionSetProxyInfo", "ptr", pwszConnectionName, DNS_CONNECTION_PROXY_TYPE, Type, DNS_CONNECTION_PROXY_INFO.Ptr, pProxyInfo, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} pwszConnectionName 
 * @param {DNS_CONNECTION_PROXY_TYPE} Type 
 * @returns {Integer} 
 */
export DnsConnectionDeleteProxyInfo(pwszConnectionName, Type) {
    pwszConnectionName := pwszConnectionName is String ? StrPtr(pwszConnectionName) : pwszConnectionName

    result := DllCall("DNSAPI.dll\DnsConnectionDeleteProxyInfo", "ptr", pwszConnectionName, DNS_CONNECTION_PROXY_TYPE, Type, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} pwszConnectionName 
 * @param {Pointer<DNS_CONNECTION_PROXY_LIST>} pProxyList 
 * @returns {Integer} 
 */
export DnsConnectionGetProxyList(pwszConnectionName, pProxyList) {
    pwszConnectionName := pwszConnectionName is String ? StrPtr(pwszConnectionName) : pwszConnectionName

    result := DllCall("DNSAPI.dll\DnsConnectionGetProxyList", "ptr", pwszConnectionName, DNS_CONNECTION_PROXY_LIST.Ptr, pProxyList, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<DNS_CONNECTION_PROXY_LIST>} pProxyList 
 * @returns {String} Nothing - always returns an empty string
 */
export DnsConnectionFreeProxyList(pProxyList) {
    DllCall("DNSAPI.dll\DnsConnectionFreeProxyList", DNS_CONNECTION_PROXY_LIST.Ptr, pProxyList)
}

/**
 * 
 * @param {Pointer<DNS_CONNECTION_NAME_LIST>} pNameList 
 * @returns {Integer} 
 */
export DnsConnectionGetNameList(pNameList) {
    result := DllCall("DNSAPI.dll\DnsConnectionGetNameList", DNS_CONNECTION_NAME_LIST.Ptr, pNameList, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<DNS_CONNECTION_NAME_LIST>} pNameList 
 * @returns {String} Nothing - always returns an empty string
 */
export DnsConnectionFreeNameList(pNameList) {
    DllCall("DNSAPI.dll\DnsConnectionFreeNameList", DNS_CONNECTION_NAME_LIST.Ptr, pNameList)
}

/**
 * 
 * @param {Pointer<DNS_CONNECTION_IFINDEX_LIST>} pConnectionIfIndexEntries 
 * @returns {Integer} 
 */
export DnsConnectionUpdateIfIndexTable(pConnectionIfIndexEntries) {
    result := DllCall("DNSAPI.dll\DnsConnectionUpdateIfIndexTable", DNS_CONNECTION_IFINDEX_LIST.Ptr, pConnectionIfIndexEntries, UInt32)
    return result
}

/**
 * 
 * @param {DNS_CONNECTION_POLICY_TAG} PolicyEntryTag 
 * @param {Pointer<DNS_CONNECTION_POLICY_ENTRY_LIST>} pPolicyEntryList 
 * @returns {Integer} 
 */
export DnsConnectionSetPolicyEntries(PolicyEntryTag, pPolicyEntryList) {
    result := DllCall("DNSAPI.dll\DnsConnectionSetPolicyEntries", DNS_CONNECTION_POLICY_TAG, PolicyEntryTag, DNS_CONNECTION_POLICY_ENTRY_LIST.Ptr, pPolicyEntryList, UInt32)
    return result
}

/**
 * 
 * @param {DNS_CONNECTION_POLICY_TAG} PolicyEntryTag 
 * @returns {Integer} 
 */
export DnsConnectionDeletePolicyEntries(PolicyEntryTag) {
    result := DllCall("DNSAPI.dll\DnsConnectionDeletePolicyEntries", DNS_CONNECTION_POLICY_TAG, PolicyEntryTag, UInt32)
    return result
}

/**
 * Used to build a [DNS_SERVICE_INSTANCE](../windns/ns-windns-dns_service_instance.md) structure from data that describes it.
 * @remarks
 * The **dwInterfaceIndex** field of the returned structure is set to 0.
 * @param {PWSTR} pServiceName A string that represents the name of the service.
 * @param {PWSTR} pHostName A string that represents the name of the host of the service.
 * @param {Pointer<Integer>} pIp4 A pointer to an **IP4_ADDRESS** structure that represents the service-associated IPv4 address.
 * @param {Pointer<IP6_ADDRESS>} pIp6 A pointer to an [IP6_ADDRESS](/windows/win32/api/windns/ns-windns-ip6_address) structure that represents the service-associated IPv6 address.
 * @param {Integer} wPort A value that represents the port on which the service is running.
 * @param {Integer} wPriority A value that represents the service priority.
 * @param {Integer} wWeight A value that represents the service weight.
 * @param {Integer} dwPropertiesCount The number of properties&mdash;defines the number of elements in the arrays of the `keys` and `values` parameters.
 * @param {Pointer<PWSTR>} keys A pointer to an array of string values that represent the property keys.
 * @param {Pointer<PWSTR>} values A pointer to an array of string values that represent the corresponding property values.
 * @returns {Pointer<DNS_SERVICE_INSTANCE>} A pointer to a newly allocated [DNS_SERVICE_INSTANCE](ns-windns-dns_service_instance.md) structure, built from the passed-in parameters. Your application is responsible for freeing the associated memory by calling [DnsServiceFreeInstance](nf-windns-dnsservicefreeinstance.md).
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsserviceconstructinstance
 * @since windows10.0.10240
 */
export DnsServiceConstructInstance(pServiceName, pHostName, pIp4, pIp6, wPort, wPriority, wWeight, dwPropertiesCount, keys, values) {
    pServiceName := pServiceName is String ? StrPtr(pServiceName) : pServiceName
    pHostName := pHostName is String ? StrPtr(pHostName) : pHostName

    pIp4Marshal := pIp4 is VarRef ? "uint*" : "ptr"
    keysMarshal := keys is VarRef ? "ptr*" : "ptr"
    valuesMarshal := values is VarRef ? "ptr*" : "ptr"

    result := DllCall("DNSAPI.dll\DnsServiceConstructInstance", "ptr", pServiceName, "ptr", pHostName, pIp4Marshal, pIp4, IP6_ADDRESS.Ptr, pIp6, "ushort", wPort, "ushort", wPriority, "ushort", wWeight, "uint", dwPropertiesCount, keysMarshal, keys, valuesMarshal, values, DNS_SERVICE_INSTANCE.Ptr)
    return result
}

/**
 * Used to copy a [DNS_SERVICE_INSTANCE](../windns/ns-windns-dns_service_instance.md) structure.
 * @param {Pointer<DNS_SERVICE_INSTANCE>} pOrig A pointer to the [DNS_SERVICE_INSTANCE](ns-windns-dns_service_instance.md) structure that is to be copied.
 * @returns {Pointer<DNS_SERVICE_INSTANCE>} A pointer to a newly allocated [DNS_SERVICE_INSTANCE](ns-windns-dns_service_instance.md) structure that's a copy of `pOrig`. Your application is responsible for freeing the associated memory by calling [DnsServiceFreeInstance](nf-windns-dnsservicefreeinstance.md).
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsservicecopyinstance
 * @since windows10.0.10240
 */
export DnsServiceCopyInstance(pOrig) {
    result := DllCall("DNSAPI.dll\DnsServiceCopyInstance", DNS_SERVICE_INSTANCE.Ptr, pOrig, DNS_SERVICE_INSTANCE.Ptr)
    return result
}

/**
 * Used to free the resources associated with a [DNS_SERVICE_INSTANCE](../windns/ns-windns-dns_service_instance.md) structure.
 * @param {Pointer<DNS_SERVICE_INSTANCE>} pInstance A pointer to the [DNS_SERVICE_INSTANCE](ns-windns-dns_service_instance.md) structure that is to be freed.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsservicefreeinstance
 * @since windows10.0.10240
 */
export DnsServiceFreeInstance(pInstance) {
    DllCall("DNSAPI.dll\DnsServiceFreeInstance", DNS_SERVICE_INSTANCE.Ptr, pInstance)
}

/**
 * Used to initiate a DNS-SD discovery for services running on the local network.
 * @remarks
 * This function is asynchronous. As services are being discovered, the browse callback will be invoked for each result.
 * @param {Pointer<DNS_SERVICE_BROWSE_REQUEST>} pRequest A pointer to a [DNS_SERVICE_BROWSE_REQUEST](ns-windns-dns_service_browse_request.md) structure that contains the browse request information.
 * @param {Pointer<DNS_SERVICE_CANCEL>} pCancel A pointer to a [DNS_SERVICE_CANCEL](ns-windns-dns_service_cancel.md) structure that can be used to cancel a pending asynchronous browsing operation. This handle must remain valid until the query is canceled.
 * @returns {Integer} If successful, returns **DNS_REQUEST_PENDING**; otherwise, returns the appropriate DNS-specific error code as defined in `Winerror.h`. For extended error information, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsservicebrowse
 * @since windows10.0.10240
 */
export DnsServiceBrowse(pRequest, pCancel) {
    A_LastError := 0

    result := DllCall("DNSAPI.dll\DnsServiceBrowse", DNS_SERVICE_BROWSE_REQUEST.Ptr, pRequest, DNS_SERVICE_CANCEL.Ptr, pCancel, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Used to cancel a running DNS-SD discovery query.
 * @remarks
 * Canceling the query causes one further invocation of the browse callback, with status **ERROR_CANCELLED**.
 * @param {Pointer<DNS_SERVICE_CANCEL>} pCancelHandle A pointer to the [DNS_SERVICE_CANCEL](ns-windns-dns_service_cancel.md) structure that was passed to the [DnsServiceBrowse](nf-windns-dnsservicebrowse.md) call that is to be cancelled.
 * @returns {Integer} If successful, returns **ERROR_SUCCESS**; otherwise, returns the appropriate DNS-specific error code as defined in `Winerror.h`. For extended error information, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsservicebrowsecancel
 * @since windows10.0.10240
 */
export DnsServiceBrowseCancel(pCancelHandle) {
    A_LastError := 0

    result := DllCall("DNSAPI.dll\DnsServiceBrowseCancel", DNS_SERVICE_CANCEL.Ptr, pCancelHandle, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Used to obtain more information about a service advertised on the local network.
 * @remarks
 * This function is asynchronous. Upon completion, the resolve callback will be invoked for each result. In contrast to [DnsServiceBrowse](nf-windns-dnsservicebrowse.md)&mdash;which returns the service name as a minimum&mdash;**DnsServiceResolve** can be used to retrieve additional information, such as hostname, IP address, and TEXT records.
 * @param {Pointer<DNS_SERVICE_RESOLVE_REQUEST>} pRequest A pointer to a [DNS_SERVICE_RESOLVE_REQUEST](ns-windns-dns_service_resolve_request.md) structure that contains the resolve request information.
 * @param {Pointer<DNS_SERVICE_CANCEL>} pCancel A pointer to a [DNS_SERVICE_CANCEL](ns-windns-dns_service_cancel.md) structure that can be used to cancel a pending asynchronous resolve operation. This handle must remain valid until the query is canceled.
 * @returns {Integer} If successful, returns **DNS_REQUEST_PENDING**; otherwise, returns the appropriate DNS-specific error code as defined in `Winerror.h`. For extended error information, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsserviceresolve
 * @since windows10.0.10240
 */
export DnsServiceResolve(pRequest, pCancel) {
    A_LastError := 0

    result := DllCall("DNSAPI.dll\DnsServiceResolve", DNS_SERVICE_RESOLVE_REQUEST.Ptr, pRequest, DNS_SERVICE_CANCEL.Ptr, pCancel, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Used to cancel a running DNS-SD resolve query.
 * @param {Pointer<DNS_SERVICE_CANCEL>} pCancelHandle A pointer to the [DNS_SERVICE_CANCEL](ns-windns-dns_service_cancel.md) structure that was passed to the [DnsServiceResolve](nf-windns-dnsserviceresolve.md) call that is to be cancelled.
 * @returns {Integer} If successful, returns **ERROR_SUCCESS**; otherwise, returns the appropriate DNS-specific error code as defined in `Winerror.h`. For extended error information, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsserviceresolvecancel
 * @since windows10.0.10240
 */
export DnsServiceResolveCancel(pCancelHandle) {
    A_LastError := 0

    result := DllCall("DNSAPI.dll\DnsServiceResolveCancel", DNS_SERVICE_CANCEL.Ptr, pCancelHandle, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Used to register a discoverable service on this device. (DnsServiceRegister)
 * @remarks
 * This function is asynchronous. The registration callback will be called once the registration succeeds. To deregister the service, call [DnsServiceDeRegister](nf-windns-dnsservicederegister.md).
 *  
 * The registration is tied to the lifetime of the calling process. If the process goes away, the service will be automatically deregistered.
 * @param {Pointer<DNS_SERVICE_REGISTER_REQUEST>} pRequest A pointer to a [DNS_SERVICE_REGISTER_REQUEST](ns-windns-dns_service_register_request.md) structure that contains information about the service to be registered.
 * @param {Pointer<DNS_SERVICE_CANCEL>} pCancel An optional (it can be `nullptr`) pointer to a [DNS_SERVICE_CANCEL](ns-windns-dns_service_cancel.md) structure that can be used to cancel a pending asynchronous registration operation. If not `nullptr`, then this handle must remain valid until the registration is canceled.
 * @returns {Integer} If successful, returns **DNS_REQUEST_PENDING**; otherwise, returns the appropriate DNS-specific error code as defined in `Winerror.h`. For extended error information, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsserviceregister
 * @since windows10.0.10240
 */
export DnsServiceRegister(pRequest, pCancel) {
    A_LastError := 0

    result := DllCall("DNSAPI.dll\DnsServiceRegister", DNS_SERVICE_REGISTER_REQUEST.Ptr, pRequest, DNS_SERVICE_CANCEL.Ptr, pCancel, UInt32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Used to remove a registered service.
 * @remarks
 * This function is asynchronous. The callback will be invoked when the deregistration is completed, with a copy of the [DNS_SERVICE_INSTANCE](ns-windns-dns_service_instance.md) structure that was passed to [DnsServiceRegister](nf-windns-dnsserviceregister.md) when the service was registered.
 * @param {Pointer<DNS_SERVICE_REGISTER_REQUEST>} pRequest A pointer to the [DNS_SERVICE_REGISTER_REQUEST](ns-windns-dns_service_register_request.md) structure that was used to register the service.
 * @param {Pointer<DNS_SERVICE_CANCEL>} pCancel Must be `nullptr`.
 * @returns {Integer} If successful, returns **DNS_REQUEST_PENDING**; otherwise, returns the appropriate DNS-specific error code as defined in `Winerror.h`. For extended error information, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsservicederegister
 * @since windows10.0.10240
 */
export DnsServiceDeRegister(pRequest, pCancel) {
    A_LastError := 0

    result := DllCall("DNSAPI.dll\DnsServiceDeRegister", DNS_SERVICE_REGISTER_REQUEST.Ptr, pRequest, DNS_SERVICE_CANCEL.Ptr, pCancel, UInt32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Used to cancel a pending registration operation.
 * @param {Pointer<DNS_SERVICE_CANCEL>} pCancelHandle A pointer to the [DNS_SERVICE_CANCEL](ns-windns-dns_service_cancel.md) structure that was passed to the [DnsServiceRegister](nf-windns-dnsserviceregister.md) call that is to be cancelled.
 * @returns {Integer} If successful, returns **ERROR_SUCCESS**. Returns **ERROR_CANCELLED** if the operation was already cancelled, or **ERROR_INVALID_PARAMETER** if the handle is invalid.
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsserviceregistercancel
 * @since windows10.0.10240
 */
export DnsServiceRegisterCancel(pCancelHandle) {
    result := DllCall("DNSAPI.dll\DnsServiceRegisterCancel", DNS_SERVICE_CANCEL.Ptr, pCancelHandle, UInt32)
    return result
}

/**
 * Used to register a discoverable service on this device. (DnsStartMulticastQuery)
 * @remarks
 * This function is asynchronous. The query runs indefinitely, until [DnsStopMulticastQuery](nf-windns-dnsstopmulticastquery.md) is called. For each response from the network, the query callback will be invoked with the appropriate status and results.
 * @param {Pointer<MDNS_QUERY_REQUEST>} pQueryRequest A pointer to an [MDNS_QUERY_REQUEST](ns-windns-mdns_query_request.md) structure that contains information about the query to be performed.
 * @param {Pointer<MDNS_QUERY_HANDLE>} pHandle A pointer to an [MDNS_QUERY_HANDLE](ns-windns-mdns_query_handle.md) structure that will be populated with the necessary data. This structure is to be passed later to [DnsStopMulticastQuery](nf-windns-dnsstopmulticastquery.md) to stop the query.
 * @returns {Integer} If successful, returns **ERROR_SUCCESS**; otherwise, returns the appropriate DNS-specific error code as defined in `Winerror.h`. For extended error information, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsstartmulticastquery
 * @since windows10.0.10240
 */
export DnsStartMulticastQuery(pQueryRequest, pHandle) {
    A_LastError := 0

    result := DllCall("DNSAPI.dll\DnsStartMulticastQuery", MDNS_QUERY_REQUEST.Ptr, pQueryRequest, MDNS_QUERY_HANDLE.Ptr, pHandle, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Used to stop a running [DnsStartMulticastQuery](../windns/nf-windns-dnsstartmulticastquery.md) operation.
 * @param {Pointer<MDNS_QUERY_HANDLE>} pHandle A pointer to the [MDNS_QUERY_HANDLE](ns-windns-mdns_query_handle.md) structure that was passed to the [DnsStartMulticastQuery](nf-windns-dnsstartmulticastquery.md) call that is to be stopped.
 * @returns {Integer} If successful, returns **ERROR_SUCCESS**; otherwise, returns the appropriate DNS-specific error code as defined in `Winerror.h`. For extended error information, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
 * @see https://learn.microsoft.com/windows/win32/api/windns/nf-windns-dnsstopmulticastquery
 * @since windows10.0.10240
 */
export DnsStopMulticastQuery(pHandle) {
    A_LastError := 0

    result := DllCall("DNSAPI.dll\DnsStopMulticastQuery", MDNS_QUERY_HANDLE.Ptr, pHandle, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

;@endregion Functions
