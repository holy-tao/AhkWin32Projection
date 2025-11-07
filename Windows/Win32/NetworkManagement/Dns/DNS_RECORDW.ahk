#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DNS_RECORD_FLAGS.ahk
#Include .\DNS_A_DATA.ahk
#Include .\DNS_SOA_DATAW.ahk
#Include .\DNS_PTR_DATAW.ahk
#Include .\DNS_MINFO_DATAW.ahk
#Include .\DNS_MX_DATAW.ahk
#Include .\DNS_TXT_DATAW.ahk
#Include .\DNS_NULL_DATA.ahk
#Include .\DNS_WKS_DATA.ahk
#Include .\IP6_ADDRESS.ahk
#Include .\DNS_AAAA_DATA.ahk
#Include .\DNS_KEY_DATA.ahk
#Include .\DNS_SIG_DATAW.ahk
#Include .\DNS_ATMA_DATA.ahk
#Include .\DNS_NXT_DATAW.ahk
#Include .\DNS_SRV_DATAW.ahk
#Include .\DNS_NAPTR_DATAW.ahk
#Include .\DNS_OPT_DATA.ahk
#Include .\DNS_DS_DATA.ahk
#Include .\DNS_NSEC_DATAW.ahk
#Include .\DNS_TKEY_DATAW.ahk
#Include .\DNS_TSIG_DATAW.ahk
#Include .\DNS_WINS_DATA.ahk
#Include .\DNS_WINSR_DATAW.ahk
#Include .\DNS_DHCID_DATA.ahk
#Include .\DNS_NSEC3_DATA.ahk
#Include .\DNS_NSEC3PARAM_DATA.ahk
#Include .\DNS_TLSA_DATA.ahk
#Include .\DNS_SVCB_DATA.ahk
#Include .\DNS_UNKNOWN_DATA.ahk

/**
 * Stores a DNS resource record (RR).
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_recordw
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 * @charset Unicode
 */
class DNS_RECORDW extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * A pointer to the next 
     * <b>DNS_RECORD</b> structure.
     * @type {Pointer<DNS_RECORDW>}
     */
    pNext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a string that represents the domain name of the record set. This must be in the string format that corresponds to the function called, such as ANSI, Unicode, or UTF8.
     * @type {PWSTR}
     */
    pName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A value that represents the RR <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Record Type</a>. <b>wType</b> determines the format of <b>Data</b>. For example, if the value of <b>wType</b> is <b>DNS_TYPE_A</b>, the data type of <b>Data</b> is <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_a_data">DNS_A_DATA</a>.
     * @type {Integer}
     */
    wType {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * The length, in bytes, of <b>Data</b>. For fixed-length data types, this value is the size of the corresponding data type, such as <b>sizeof(DNS_A_DATA)</b>. For the non-fixed data types, use one of the following macros to determine the length of the data: 
     * 
     * 
     * 
     * 					
     * 
     * <div class="code"><span codelanguage="ManagedCPlusPlus"><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>#include &lt;windows.h&gt;
     * @type {Integer}
     */
    wDataLength {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    DW {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {DNS_RECORD_FLAGS}
     */
    S{
        get {
            if(!this.HasProp("__S"))
                this.__S := DNS_RECORD_FLAGS(20, this)
            return this.__S
        }
    }

    /**
     * The DNS RR's Time To Live value (TTL), in seconds.
     * @type {Integer}
     */
    dwTtl {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {DNS_A_DATA}
     */
    A{
        get {
            if(!this.HasProp("__A"))
                this.__A := DNS_A_DATA(32, this)
            return this.__A
        }
    }

    /**
     * @type {DNS_SOA_DATAW}
     */
    SOA{
        get {
            if(!this.HasProp("__SOA"))
                this.__SOA := DNS_SOA_DATAW(32, this)
            return this.__SOA
        }
    }

    /**
     * @type {DNS_PTR_DATAW}
     */
    PTR{
        get {
            if(!this.HasProp("__PTR"))
                this.__PTR := DNS_PTR_DATAW(32, this)
            return this.__PTR
        }
    }

    /**
     * @type {DNS_PTR_DATAW}
     */
    NS{
        get {
            if(!this.HasProp("__NS"))
                this.__NS := DNS_PTR_DATAW(32, this)
            return this.__NS
        }
    }

    /**
     * @type {DNS_PTR_DATAW}
     */
    CNAME{
        get {
            if(!this.HasProp("__CNAME"))
                this.__CNAME := DNS_PTR_DATAW(32, this)
            return this.__CNAME
        }
    }

    /**
     * @type {DNS_PTR_DATAW}
     */
    DNAME{
        get {
            if(!this.HasProp("__DNAME"))
                this.__DNAME := DNS_PTR_DATAW(32, this)
            return this.__DNAME
        }
    }

    /**
     * @type {DNS_PTR_DATAW}
     */
    MB{
        get {
            if(!this.HasProp("__MB"))
                this.__MB := DNS_PTR_DATAW(32, this)
            return this.__MB
        }
    }

    /**
     * @type {DNS_PTR_DATAW}
     */
    MD{
        get {
            if(!this.HasProp("__MD"))
                this.__MD := DNS_PTR_DATAW(32, this)
            return this.__MD
        }
    }

    /**
     * @type {DNS_PTR_DATAW}
     */
    MF{
        get {
            if(!this.HasProp("__MF"))
                this.__MF := DNS_PTR_DATAW(32, this)
            return this.__MF
        }
    }

    /**
     * @type {DNS_PTR_DATAW}
     */
    MG{
        get {
            if(!this.HasProp("__MG"))
                this.__MG := DNS_PTR_DATAW(32, this)
            return this.__MG
        }
    }

    /**
     * @type {DNS_PTR_DATAW}
     */
    MR{
        get {
            if(!this.HasProp("__MR"))
                this.__MR := DNS_PTR_DATAW(32, this)
            return this.__MR
        }
    }

    /**
     * @type {DNS_MINFO_DATAW}
     */
    MINFO{
        get {
            if(!this.HasProp("__MINFO"))
                this.__MINFO := DNS_MINFO_DATAW(32, this)
            return this.__MINFO
        }
    }

    /**
     * @type {DNS_MINFO_DATAW}
     */
    RP{
        get {
            if(!this.HasProp("__RP"))
                this.__RP := DNS_MINFO_DATAW(32, this)
            return this.__RP
        }
    }

    /**
     * @type {DNS_MX_DATAW}
     */
    MX{
        get {
            if(!this.HasProp("__MX"))
                this.__MX := DNS_MX_DATAW(32, this)
            return this.__MX
        }
    }

    /**
     * @type {DNS_MX_DATAW}
     */
    AFSDB{
        get {
            if(!this.HasProp("__AFSDB"))
                this.__AFSDB := DNS_MX_DATAW(32, this)
            return this.__AFSDB
        }
    }

    /**
     * @type {DNS_MX_DATAW}
     */
    RT{
        get {
            if(!this.HasProp("__RT"))
                this.__RT := DNS_MX_DATAW(32, this)
            return this.__RT
        }
    }

    /**
     * @type {DNS_TXT_DATAW}
     */
    HINFO{
        get {
            if(!this.HasProp("__HINFO"))
                this.__HINFO := DNS_TXT_DATAW(32, this)
            return this.__HINFO
        }
    }

    /**
     * @type {DNS_TXT_DATAW}
     */
    ISDN{
        get {
            if(!this.HasProp("__ISDN"))
                this.__ISDN := DNS_TXT_DATAW(32, this)
            return this.__ISDN
        }
    }

    /**
     * @type {DNS_TXT_DATAW}
     */
    TXT{
        get {
            if(!this.HasProp("__TXT"))
                this.__TXT := DNS_TXT_DATAW(32, this)
            return this.__TXT
        }
    }

    /**
     * @type {DNS_TXT_DATAW}
     */
    X25{
        get {
            if(!this.HasProp("__X25"))
                this.__X25 := DNS_TXT_DATAW(32, this)
            return this.__X25
        }
    }

    /**
     * @type {DNS_NULL_DATA}
     */
    Null{
        get {
            if(!this.HasProp("__Null"))
                this.__Null := DNS_NULL_DATA(32, this)
            return this.__Null
        }
    }

    /**
     * @type {DNS_WKS_DATA}
     */
    WKS{
        get {
            if(!this.HasProp("__WKS"))
                this.__WKS := DNS_WKS_DATA(32, this)
            return this.__WKS
        }
    }

    /**
     * @type {DNS_AAAA_DATA}
     */
    AAAA{
        get {
            if(!this.HasProp("__AAAA"))
                this.__AAAA := DNS_AAAA_DATA(32, this)
            return this.__AAAA
        }
    }

    /**
     * @type {DNS_KEY_DATA}
     */
    KEY{
        get {
            if(!this.HasProp("__KEY"))
                this.__KEY := DNS_KEY_DATA(32, this)
            return this.__KEY
        }
    }

    /**
     * @type {DNS_SIG_DATAW}
     */
    SIG{
        get {
            if(!this.HasProp("__SIG"))
                this.__SIG := DNS_SIG_DATAW(32, this)
            return this.__SIG
        }
    }

    /**
     * @type {DNS_ATMA_DATA}
     */
    ATMA{
        get {
            if(!this.HasProp("__ATMA"))
                this.__ATMA := DNS_ATMA_DATA(32, this)
            return this.__ATMA
        }
    }

    /**
     * @type {DNS_NXT_DATAW}
     */
    NXT{
        get {
            if(!this.HasProp("__NXT"))
                this.__NXT := DNS_NXT_DATAW(32, this)
            return this.__NXT
        }
    }

    /**
     * @type {DNS_SRV_DATAW}
     */
    SRV{
        get {
            if(!this.HasProp("__SRV"))
                this.__SRV := DNS_SRV_DATAW(32, this)
            return this.__SRV
        }
    }

    /**
     * @type {DNS_NAPTR_DATAW}
     */
    NAPTR{
        get {
            if(!this.HasProp("__NAPTR"))
                this.__NAPTR := DNS_NAPTR_DATAW(32, this)
            return this.__NAPTR
        }
    }

    /**
     * @type {DNS_OPT_DATA}
     */
    OPT{
        get {
            if(!this.HasProp("__OPT"))
                this.__OPT := DNS_OPT_DATA(32, this)
            return this.__OPT
        }
    }

    /**
     * @type {DNS_DS_DATA}
     */
    DS{
        get {
            if(!this.HasProp("__DS"))
                this.__DS := DNS_DS_DATA(32, this)
            return this.__DS
        }
    }

    /**
     * @type {DNS_SIG_DATAW}
     */
    RRSIG{
        get {
            if(!this.HasProp("__RRSIG"))
                this.__RRSIG := DNS_SIG_DATAW(32, this)
            return this.__RRSIG
        }
    }

    /**
     * @type {DNS_NSEC_DATAW}
     */
    NSEC{
        get {
            if(!this.HasProp("__NSEC"))
                this.__NSEC := DNS_NSEC_DATAW(32, this)
            return this.__NSEC
        }
    }

    /**
     * @type {DNS_KEY_DATA}
     */
    DNSKEY{
        get {
            if(!this.HasProp("__DNSKEY"))
                this.__DNSKEY := DNS_KEY_DATA(32, this)
            return this.__DNSKEY
        }
    }

    /**
     * @type {DNS_TKEY_DATAW}
     */
    TKEY{
        get {
            if(!this.HasProp("__TKEY"))
                this.__TKEY := DNS_TKEY_DATAW(32, this)
            return this.__TKEY
        }
    }

    /**
     * @type {DNS_TSIG_DATAW}
     */
    TSIG{
        get {
            if(!this.HasProp("__TSIG"))
                this.__TSIG := DNS_TSIG_DATAW(32, this)
            return this.__TSIG
        }
    }

    /**
     * @type {DNS_WINS_DATA}
     */
    WINS{
        get {
            if(!this.HasProp("__WINS"))
                this.__WINS := DNS_WINS_DATA(32, this)
            return this.__WINS
        }
    }

    /**
     * @type {DNS_WINSR_DATAW}
     */
    WINSR{
        get {
            if(!this.HasProp("__WINSR"))
                this.__WINSR := DNS_WINSR_DATAW(32, this)
            return this.__WINSR
        }
    }

    /**
     * @type {DNS_WINSR_DATAW}
     */
    NBSTAT{
        get {
            if(!this.HasProp("__NBSTAT"))
                this.__NBSTAT := DNS_WINSR_DATAW(32, this)
            return this.__NBSTAT
        }
    }

    /**
     * @type {DNS_DHCID_DATA}
     */
    DHCID{
        get {
            if(!this.HasProp("__DHCID"))
                this.__DHCID := DNS_DHCID_DATA(32, this)
            return this.__DHCID
        }
    }

    /**
     * @type {DNS_NSEC3_DATA}
     */
    NSEC3{
        get {
            if(!this.HasProp("__NSEC3"))
                this.__NSEC3 := DNS_NSEC3_DATA(32, this)
            return this.__NSEC3
        }
    }

    /**
     * @type {DNS_NSEC3PARAM_DATA}
     */
    NSEC3PARAM{
        get {
            if(!this.HasProp("__NSEC3PARAM"))
                this.__NSEC3PARAM := DNS_NSEC3PARAM_DATA(32, this)
            return this.__NSEC3PARAM
        }
    }

    /**
     * @type {DNS_TLSA_DATA}
     */
    TLSA{
        get {
            if(!this.HasProp("__TLSA"))
                this.__TLSA := DNS_TLSA_DATA(32, this)
            return this.__TLSA
        }
    }

    /**
     * @type {DNS_SVCB_DATA}
     */
    SVCB{
        get {
            if(!this.HasProp("__SVCB"))
                this.__SVCB := DNS_SVCB_DATA(32, this)
            return this.__SVCB
        }
    }

    /**
     * @type {DNS_UNKNOWN_DATA}
     */
    UNKNOWN{
        get {
            if(!this.HasProp("__UNKNOWN"))
                this.__UNKNOWN := DNS_UNKNOWN_DATA(32, this)
            return this.__UNKNOWN
        }
    }

    /**
     * @type {Pointer<Integer>}
     */
    pDataPtr {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
