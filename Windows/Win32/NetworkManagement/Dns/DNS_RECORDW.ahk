#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_NSEC_DATAW.ahk" { DNS_NSEC_DATAW }
#Import ".\DNS_WINSR_DATAW.ahk" { DNS_WINSR_DATAW }
#Import ".\DNS_PTR_DATAW.ahk" { DNS_PTR_DATAW }
#Import ".\DNS_SOA_DATAW.ahk" { DNS_SOA_DATAW }
#Import ".\DNS_TXT_DATAW.ahk" { DNS_TXT_DATAW }
#Import ".\DNS_TSIG_DATAW.ahk" { DNS_TSIG_DATAW }
#Import ".\DNS_ATMA_DATA.ahk" { DNS_ATMA_DATA }
#Import ".\DNS_WINS_DATA.ahk" { DNS_WINS_DATA }
#Import ".\DNS_NXT_DATAW.ahk" { DNS_NXT_DATAW }
#Import ".\DNS_NSEC3_DATA.ahk" { DNS_NSEC3_DATA }
#Import ".\DNS_SRV_DATAW.ahk" { DNS_SRV_DATAW }
#Import ".\DNS_SIG_DATAW.ahk" { DNS_SIG_DATAW }
#Import ".\DNS_NSEC3PARAM_DATA.ahk" { DNS_NSEC3PARAM_DATA }
#Import ".\DNS_AAAA_DATA.ahk" { DNS_AAAA_DATA }
#Import ".\DNS_WKS_DATA.ahk" { DNS_WKS_DATA }
#Import ".\DNS_SVCB_DATA.ahk" { DNS_SVCB_DATA }
#Import ".\DNS_TLSA_DATA.ahk" { DNS_TLSA_DATA }
#Import ".\DNS_A_DATA.ahk" { DNS_A_DATA }
#Import ".\DNS_NULL_DATA.ahk" { DNS_NULL_DATA }
#Import ".\DNS_DS_DATA.ahk" { DNS_DS_DATA }
#Import ".\DNS_MX_DATAW.ahk" { DNS_MX_DATAW }
#Import ".\DNS_RECORD_FLAGS.ahk" { DNS_RECORD_FLAGS }
#Import ".\DNS_OPT_DATA.ahk" { DNS_OPT_DATA }
#Import ".\DNS_KEY_DATA.ahk" { DNS_KEY_DATA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DNS_DHCID_DATA.ahk" { DNS_DHCID_DATA }
#Import ".\DNS_SVCB_PARAM.ahk" { DNS_SVCB_PARAM }
#Import ".\IP6_ADDRESS.ahk" { IP6_ADDRESS }
#Import ".\DNS_UNKNOWN_DATA.ahk" { DNS_UNKNOWN_DATA }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DNS_MINFO_DATAW.ahk" { DNS_MINFO_DATAW }
#Import ".\DNS_TKEY_DATAW.ahk" { DNS_TKEY_DATAW }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\DNS_NAPTR_DATAW.ahk" { DNS_NAPTR_DATAW }

/**
 * Stores a DNS resource record (RR). (Unicode)
 * @remarks
 * When building a 
 * <b>DNS_RECORD</b> list as an input argument for the various DNS update routines found in the DNS API, all flags in the 
 * <b>DNS_RECORD</b> structure should be set to zero.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The windns.h header defines DNS_RECORD as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_recordw
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @charset Unicode
 */
export default struct DNS_RECORDW {
    #StructPack 8


    struct _Flags {
        DW : UInt32

        static __New() {
            DefineProp(this.Prototype, 'S', { type: DNS_RECORD_FLAGS, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _Data {
        A : DNS_A_DATA

        static __New() {
            DefineProp(this.Prototype, 'SOA', { type: DNS_SOA_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Soa1', { type: DNS_SOA_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'PTR', { type: DNS_PTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Ptr1', { type: DNS_PTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'NS', { type: DNS_PTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Ns1', { type: DNS_PTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'CNAME', { type: DNS_PTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Cname1', { type: DNS_PTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'DNAME', { type: DNS_PTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Dname1', { type: DNS_PTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'MB', { type: DNS_PTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Mb1', { type: DNS_PTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'MD', { type: DNS_PTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Md1', { type: DNS_PTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'MF', { type: DNS_PTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Mf1', { type: DNS_PTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'MG', { type: DNS_PTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Mg1', { type: DNS_PTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'MR', { type: DNS_PTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Mr1', { type: DNS_PTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'MINFO', { type: DNS_MINFO_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Minfo1', { type: DNS_MINFO_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'RP', { type: DNS_MINFO_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Rp1', { type: DNS_MINFO_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'MX', { type: DNS_MX_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Mx1', { type: DNS_MX_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'AFSDB', { type: DNS_MX_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Afsdb1', { type: DNS_MX_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'RT', { type: DNS_MX_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Rt1', { type: DNS_MX_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'HINFO', { type: DNS_TXT_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Hinfo1', { type: DNS_TXT_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'ISDN', { type: DNS_TXT_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Isdn1', { type: DNS_TXT_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'TXT', { type: DNS_TXT_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Txt1', { type: DNS_TXT_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'X25', { type: DNS_TXT_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Null', { type: DNS_NULL_DATA, offset: 0 })
            DefineProp(this.Prototype, 'WKS', { type: DNS_WKS_DATA, offset: 0 })
            DefineProp(this.Prototype, 'Wks1', { type: DNS_WKS_DATA, offset: 0 })
            DefineProp(this.Prototype, 'AAAA', { type: DNS_AAAA_DATA, offset: 0 })
            DefineProp(this.Prototype, 'KEY', { type: DNS_KEY_DATA, offset: 0 })
            DefineProp(this.Prototype, 'Key1', { type: DNS_KEY_DATA, offset: 0 })
            DefineProp(this.Prototype, 'SIG', { type: DNS_SIG_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Sig1', { type: DNS_SIG_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'ATMA', { type: DNS_ATMA_DATA, offset: 0 })
            DefineProp(this.Prototype, 'Atma1', { type: DNS_ATMA_DATA, offset: 0 })
            DefineProp(this.Prototype, 'NXT', { type: DNS_NXT_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Nxt1', { type: DNS_NXT_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'SRV', { type: DNS_SRV_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Srv1', { type: DNS_SRV_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'NAPTR', { type: DNS_NAPTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Naptr1', { type: DNS_NAPTR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'OPT', { type: DNS_OPT_DATA, offset: 0 })
            DefineProp(this.Prototype, 'Opt1', { type: DNS_OPT_DATA, offset: 0 })
            DefineProp(this.Prototype, 'DS', { type: DNS_DS_DATA, offset: 0 })
            DefineProp(this.Prototype, 'Ds1', { type: DNS_DS_DATA, offset: 0 })
            DefineProp(this.Prototype, 'RRSIG', { type: DNS_SIG_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Rrsig1', { type: DNS_SIG_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'NSEC', { type: DNS_NSEC_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Nsec1', { type: DNS_NSEC_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'DNSKEY', { type: DNS_KEY_DATA, offset: 0 })
            DefineProp(this.Prototype, 'Dnskey1', { type: DNS_KEY_DATA, offset: 0 })
            DefineProp(this.Prototype, 'TKEY', { type: DNS_TKEY_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Tkey1', { type: DNS_TKEY_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'TSIG', { type: DNS_TSIG_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Tsig1', { type: DNS_TSIG_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'WINS', { type: DNS_WINS_DATA, offset: 0 })
            DefineProp(this.Prototype, 'Wins1', { type: DNS_WINS_DATA, offset: 0 })
            DefineProp(this.Prototype, 'WINSR', { type: DNS_WINSR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'WinsR1', { type: DNS_WINSR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'NBSTAT', { type: DNS_WINSR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'Nbstat1', { type: DNS_WINSR_DATAW, offset: 0 })
            DefineProp(this.Prototype, 'DHCID', { type: DNS_DHCID_DATA, offset: 0 })
            DefineProp(this.Prototype, 'NSEC3', { type: DNS_NSEC3_DATA, offset: 0 })
            DefineProp(this.Prototype, 'Nsec31', { type: DNS_NSEC3_DATA, offset: 0 })
            DefineProp(this.Prototype, 'NSEC3PARAM', { type: DNS_NSEC3PARAM_DATA, offset: 0 })
            DefineProp(this.Prototype, 'Nsec3Param1', { type: DNS_NSEC3PARAM_DATA, offset: 0 })
            DefineProp(this.Prototype, 'TLSA', { type: DNS_TLSA_DATA, offset: 0 })
            DefineProp(this.Prototype, 'Tlsa1', { type: DNS_TLSA_DATA, offset: 0 })
            DefineProp(this.Prototype, 'SVCB', { type: DNS_SVCB_DATA, offset: 0 })
            DefineProp(this.Prototype, 'Svcb1', { type: DNS_SVCB_DATA, offset: 0 })
            DefineProp(this.Prototype, 'UNKNOWN', { type: DNS_UNKNOWN_DATA, offset: 0 })
            DefineProp(this.Prototype, 'Unknown1', { type: DNS_UNKNOWN_DATA, offset: 0 })
            DefineProp(this.Prototype, 'pDataPtr', { type: IntPtr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * A pointer to the next 
     * <b>DNS_RECORD</b> structure.
     */
    pNext : DNS_RECORDW.Ptr

    /**
     * A pointer to a string that represents the domain name of the record set. This must be in the string format that corresponds to the function called, such as ANSI, Unicode, or UTF8.
     */
    pName : PWSTR

    /**
     * A value that represents the RR <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Record Type</a>. <b>wType</b> determines the format of <b>Data</b>. For example, if the value of <b>wType</b> is <b>DNS_TYPE_A</b>, the data type of <b>Data</b> is <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_a_data">DNS_A_DATA</a>.
     */
    wType : UInt16

    /**
     * The length, in bytes, of <b>Data</b>. For fixed-length data types, this value is the size of the corresponding data type, such as <b>sizeof(DNS_A_DATA)</b>. For the non-fixed data types, use one of the following macros to determine the length of the data: 
     * 
     * 
     * 
     * 					
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>#include &lt;windows.h&gt;
     */
    wDataLength : UInt16

    Flags : DNS_RECORDW._Flags

    /**
     * The DNS RR's Time To Live value (TTL), in seconds.
     */
    dwTtl : UInt32

    /**
     * Reserved. Do not use.
     */
    dwReserved : UInt32

    /**
     * The DNS RR data type is determined by <b>wType</b> and is one of the following members:
     */
    Data : DNS_RECORDW._Data

}
