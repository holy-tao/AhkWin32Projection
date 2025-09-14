#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DNS_SOA_DATAW.ahk
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
 * @version v4.0.30319
 * @charset Unicode
 */
class DNS_RECORDW extends Win32Struct
{
    static sizeof => 40

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
     * @type {Pointer<PWSTR>}
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
     * <div class="code"><span><table>
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
     * @type {Integer}
     */
    S {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
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
     * @type {Integer}
     */
    A {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {DNS_SOA_DATAW}
     */
    SOA{
        get {
            if(!this.HasProp("__SOA"))
                this.__SOA := DNS_SOA_DATAW(this.ptr + 32)
            return this.__SOA
        }
    }

    /**
     * @type {DNS_SOA_DATAW}
     */
    Soa1{
        get {
            if(!this.HasProp("__Soa1"))
                this.__Soa1 := DNS_SOA_DATAW(this.ptr + 32)
            return this.__Soa1
        }
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    PTR {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    Ptr1 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    NS {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    Ns1 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    CNAME {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    Cname1 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    DNAME {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    Dname1 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    MB {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    Mb1 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    MD {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    Md1 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    MF {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    Mf1 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    MG {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    Mg1 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    MR {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    Mr1 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {DNS_MINFO_DATAW}
     */
    MINFO{
        get {
            if(!this.HasProp("__MINFO"))
                this.__MINFO := DNS_MINFO_DATAW(this.ptr + 32)
            return this.__MINFO
        }
    }

    /**
     * @type {DNS_MINFO_DATAW}
     */
    Minfo1{
        get {
            if(!this.HasProp("__Minfo1"))
                this.__Minfo1 := DNS_MINFO_DATAW(this.ptr + 32)
            return this.__Minfo1
        }
    }

    /**
     * @type {DNS_MINFO_DATAW}
     */
    RP{
        get {
            if(!this.HasProp("__RP"))
                this.__RP := DNS_MINFO_DATAW(this.ptr + 32)
            return this.__RP
        }
    }

    /**
     * @type {DNS_MINFO_DATAW}
     */
    Rp1{
        get {
            if(!this.HasProp("__Rp1"))
                this.__Rp1 := DNS_MINFO_DATAW(this.ptr + 32)
            return this.__Rp1
        }
    }

    /**
     * @type {DNS_MX_DATAW}
     */
    MX{
        get {
            if(!this.HasProp("__MX"))
                this.__MX := DNS_MX_DATAW(this.ptr + 32)
            return this.__MX
        }
    }

    /**
     * @type {DNS_MX_DATAW}
     */
    Mx1{
        get {
            if(!this.HasProp("__Mx1"))
                this.__Mx1 := DNS_MX_DATAW(this.ptr + 32)
            return this.__Mx1
        }
    }

    /**
     * @type {DNS_MX_DATAW}
     */
    AFSDB{
        get {
            if(!this.HasProp("__AFSDB"))
                this.__AFSDB := DNS_MX_DATAW(this.ptr + 32)
            return this.__AFSDB
        }
    }

    /**
     * @type {DNS_MX_DATAW}
     */
    Afsdb1{
        get {
            if(!this.HasProp("__Afsdb1"))
                this.__Afsdb1 := DNS_MX_DATAW(this.ptr + 32)
            return this.__Afsdb1
        }
    }

    /**
     * @type {DNS_MX_DATAW}
     */
    RT{
        get {
            if(!this.HasProp("__RT"))
                this.__RT := DNS_MX_DATAW(this.ptr + 32)
            return this.__RT
        }
    }

    /**
     * @type {DNS_MX_DATAW}
     */
    Rt1{
        get {
            if(!this.HasProp("__Rt1"))
                this.__Rt1 := DNS_MX_DATAW(this.ptr + 32)
            return this.__Rt1
        }
    }

    /**
     * @type {DNS_TXT_DATAW}
     */
    HINFO{
        get {
            if(!this.HasProp("__HINFO"))
                this.__HINFO := DNS_TXT_DATAW(this.ptr + 32)
            return this.__HINFO
        }
    }

    /**
     * @type {DNS_TXT_DATAW}
     */
    Hinfo1{
        get {
            if(!this.HasProp("__Hinfo1"))
                this.__Hinfo1 := DNS_TXT_DATAW(this.ptr + 32)
            return this.__Hinfo1
        }
    }

    /**
     * @type {DNS_TXT_DATAW}
     */
    ISDN{
        get {
            if(!this.HasProp("__ISDN"))
                this.__ISDN := DNS_TXT_DATAW(this.ptr + 32)
            return this.__ISDN
        }
    }

    /**
     * @type {DNS_TXT_DATAW}
     */
    Isdn1{
        get {
            if(!this.HasProp("__Isdn1"))
                this.__Isdn1 := DNS_TXT_DATAW(this.ptr + 32)
            return this.__Isdn1
        }
    }

    /**
     * @type {DNS_TXT_DATAW}
     */
    TXT{
        get {
            if(!this.HasProp("__TXT"))
                this.__TXT := DNS_TXT_DATAW(this.ptr + 32)
            return this.__TXT
        }
    }

    /**
     * @type {DNS_TXT_DATAW}
     */
    Txt1{
        get {
            if(!this.HasProp("__Txt1"))
                this.__Txt1 := DNS_TXT_DATAW(this.ptr + 32)
            return this.__Txt1
        }
    }

    /**
     * @type {DNS_TXT_DATAW}
     */
    X25{
        get {
            if(!this.HasProp("__X25"))
                this.__X25 := DNS_TXT_DATAW(this.ptr + 32)
            return this.__X25
        }
    }

    /**
     * @type {DNS_NULL_DATA}
     */
    Null{
        get {
            if(!this.HasProp("__Null"))
                this.__Null := DNS_NULL_DATA(this.ptr + 32)
            return this.__Null
        }
    }

    /**
     * @type {DNS_WKS_DATA}
     */
    WKS{
        get {
            if(!this.HasProp("__WKS"))
                this.__WKS := DNS_WKS_DATA(this.ptr + 32)
            return this.__WKS
        }
    }

    /**
     * @type {DNS_WKS_DATA}
     */
    Wks1{
        get {
            if(!this.HasProp("__Wks1"))
                this.__Wks1 := DNS_WKS_DATA(this.ptr + 32)
            return this.__Wks1
        }
    }

    /**
     * @type {DNS_AAAA_DATA}
     */
    AAAA{
        get {
            if(!this.HasProp("__AAAA"))
                this.__AAAA := DNS_AAAA_DATA(this.ptr + 32)
            return this.__AAAA
        }
    }

    /**
     * @type {DNS_KEY_DATA}
     */
    KEY{
        get {
            if(!this.HasProp("__KEY"))
                this.__KEY := DNS_KEY_DATA(this.ptr + 32)
            return this.__KEY
        }
    }

    /**
     * @type {DNS_KEY_DATA}
     */
    Key1{
        get {
            if(!this.HasProp("__Key1"))
                this.__Key1 := DNS_KEY_DATA(this.ptr + 32)
            return this.__Key1
        }
    }

    /**
     * @type {DNS_SIG_DATAW}
     */
    SIG{
        get {
            if(!this.HasProp("__SIG"))
                this.__SIG := DNS_SIG_DATAW(this.ptr + 32)
            return this.__SIG
        }
    }

    /**
     * @type {DNS_SIG_DATAW}
     */
    Sig1{
        get {
            if(!this.HasProp("__Sig1"))
                this.__Sig1 := DNS_SIG_DATAW(this.ptr + 32)
            return this.__Sig1
        }
    }

    /**
     * @type {DNS_ATMA_DATA}
     */
    ATMA{
        get {
            if(!this.HasProp("__ATMA"))
                this.__ATMA := DNS_ATMA_DATA(this.ptr + 32)
            return this.__ATMA
        }
    }

    /**
     * @type {DNS_ATMA_DATA}
     */
    Atma1{
        get {
            if(!this.HasProp("__Atma1"))
                this.__Atma1 := DNS_ATMA_DATA(this.ptr + 32)
            return this.__Atma1
        }
    }

    /**
     * @type {DNS_NXT_DATAW}
     */
    NXT{
        get {
            if(!this.HasProp("__NXT"))
                this.__NXT := DNS_NXT_DATAW(this.ptr + 32)
            return this.__NXT
        }
    }

    /**
     * @type {DNS_NXT_DATAW}
     */
    Nxt1{
        get {
            if(!this.HasProp("__Nxt1"))
                this.__Nxt1 := DNS_NXT_DATAW(this.ptr + 32)
            return this.__Nxt1
        }
    }

    /**
     * @type {DNS_SRV_DATAW}
     */
    SRV{
        get {
            if(!this.HasProp("__SRV"))
                this.__SRV := DNS_SRV_DATAW(this.ptr + 32)
            return this.__SRV
        }
    }

    /**
     * @type {DNS_SRV_DATAW}
     */
    Srv1{
        get {
            if(!this.HasProp("__Srv1"))
                this.__Srv1 := DNS_SRV_DATAW(this.ptr + 32)
            return this.__Srv1
        }
    }

    /**
     * @type {DNS_NAPTR_DATAW}
     */
    NAPTR{
        get {
            if(!this.HasProp("__NAPTR"))
                this.__NAPTR := DNS_NAPTR_DATAW(this.ptr + 32)
            return this.__NAPTR
        }
    }

    /**
     * @type {DNS_NAPTR_DATAW}
     */
    Naptr1{
        get {
            if(!this.HasProp("__Naptr1"))
                this.__Naptr1 := DNS_NAPTR_DATAW(this.ptr + 32)
            return this.__Naptr1
        }
    }

    /**
     * @type {DNS_OPT_DATA}
     */
    OPT{
        get {
            if(!this.HasProp("__OPT"))
                this.__OPT := DNS_OPT_DATA(this.ptr + 32)
            return this.__OPT
        }
    }

    /**
     * @type {DNS_OPT_DATA}
     */
    Opt1{
        get {
            if(!this.HasProp("__Opt1"))
                this.__Opt1 := DNS_OPT_DATA(this.ptr + 32)
            return this.__Opt1
        }
    }

    /**
     * @type {DNS_DS_DATA}
     */
    DS{
        get {
            if(!this.HasProp("__DS"))
                this.__DS := DNS_DS_DATA(this.ptr + 32)
            return this.__DS
        }
    }

    /**
     * @type {DNS_DS_DATA}
     */
    Ds1{
        get {
            if(!this.HasProp("__Ds1"))
                this.__Ds1 := DNS_DS_DATA(this.ptr + 32)
            return this.__Ds1
        }
    }

    /**
     * @type {DNS_SIG_DATAW}
     */
    RRSIG{
        get {
            if(!this.HasProp("__RRSIG"))
                this.__RRSIG := DNS_SIG_DATAW(this.ptr + 32)
            return this.__RRSIG
        }
    }

    /**
     * @type {DNS_SIG_DATAW}
     */
    Rrsig1{
        get {
            if(!this.HasProp("__Rrsig1"))
                this.__Rrsig1 := DNS_SIG_DATAW(this.ptr + 32)
            return this.__Rrsig1
        }
    }

    /**
     * @type {DNS_NSEC_DATAW}
     */
    NSEC{
        get {
            if(!this.HasProp("__NSEC"))
                this.__NSEC := DNS_NSEC_DATAW(this.ptr + 32)
            return this.__NSEC
        }
    }

    /**
     * @type {DNS_NSEC_DATAW}
     */
    Nsec1{
        get {
            if(!this.HasProp("__Nsec1"))
                this.__Nsec1 := DNS_NSEC_DATAW(this.ptr + 32)
            return this.__Nsec1
        }
    }

    /**
     * @type {DNS_KEY_DATA}
     */
    DNSKEY{
        get {
            if(!this.HasProp("__DNSKEY"))
                this.__DNSKEY := DNS_KEY_DATA(this.ptr + 32)
            return this.__DNSKEY
        }
    }

    /**
     * @type {DNS_KEY_DATA}
     */
    Dnskey1{
        get {
            if(!this.HasProp("__Dnskey1"))
                this.__Dnskey1 := DNS_KEY_DATA(this.ptr + 32)
            return this.__Dnskey1
        }
    }

    /**
     * @type {DNS_TKEY_DATAW}
     */
    TKEY{
        get {
            if(!this.HasProp("__TKEY"))
                this.__TKEY := DNS_TKEY_DATAW(this.ptr + 32)
            return this.__TKEY
        }
    }

    /**
     * @type {DNS_TKEY_DATAW}
     */
    Tkey1{
        get {
            if(!this.HasProp("__Tkey1"))
                this.__Tkey1 := DNS_TKEY_DATAW(this.ptr + 32)
            return this.__Tkey1
        }
    }

    /**
     * @type {DNS_TSIG_DATAW}
     */
    TSIG{
        get {
            if(!this.HasProp("__TSIG"))
                this.__TSIG := DNS_TSIG_DATAW(this.ptr + 32)
            return this.__TSIG
        }
    }

    /**
     * @type {DNS_TSIG_DATAW}
     */
    Tsig1{
        get {
            if(!this.HasProp("__Tsig1"))
                this.__Tsig1 := DNS_TSIG_DATAW(this.ptr + 32)
            return this.__Tsig1
        }
    }

    /**
     * @type {DNS_WINS_DATA}
     */
    WINS{
        get {
            if(!this.HasProp("__WINS"))
                this.__WINS := DNS_WINS_DATA(this.ptr + 32)
            return this.__WINS
        }
    }

    /**
     * @type {DNS_WINS_DATA}
     */
    Wins1{
        get {
            if(!this.HasProp("__Wins1"))
                this.__Wins1 := DNS_WINS_DATA(this.ptr + 32)
            return this.__Wins1
        }
    }

    /**
     * @type {DNS_WINSR_DATAW}
     */
    WINSR{
        get {
            if(!this.HasProp("__WINSR"))
                this.__WINSR := DNS_WINSR_DATAW(this.ptr + 32)
            return this.__WINSR
        }
    }

    /**
     * @type {DNS_WINSR_DATAW}
     */
    WinsR1{
        get {
            if(!this.HasProp("__WinsR1"))
                this.__WinsR1 := DNS_WINSR_DATAW(this.ptr + 32)
            return this.__WinsR1
        }
    }

    /**
     * @type {DNS_WINSR_DATAW}
     */
    NBSTAT{
        get {
            if(!this.HasProp("__NBSTAT"))
                this.__NBSTAT := DNS_WINSR_DATAW(this.ptr + 32)
            return this.__NBSTAT
        }
    }

    /**
     * @type {DNS_WINSR_DATAW}
     */
    Nbstat1{
        get {
            if(!this.HasProp("__Nbstat1"))
                this.__Nbstat1 := DNS_WINSR_DATAW(this.ptr + 32)
            return this.__Nbstat1
        }
    }

    /**
     * @type {DNS_DHCID_DATA}
     */
    DHCID{
        get {
            if(!this.HasProp("__DHCID"))
                this.__DHCID := DNS_DHCID_DATA(this.ptr + 32)
            return this.__DHCID
        }
    }

    /**
     * @type {DNS_NSEC3_DATA}
     */
    NSEC3{
        get {
            if(!this.HasProp("__NSEC3"))
                this.__NSEC3 := DNS_NSEC3_DATA(this.ptr + 32)
            return this.__NSEC3
        }
    }

    /**
     * @type {DNS_NSEC3_DATA}
     */
    Nsec31{
        get {
            if(!this.HasProp("__Nsec31"))
                this.__Nsec31 := DNS_NSEC3_DATA(this.ptr + 32)
            return this.__Nsec31
        }
    }

    /**
     * @type {DNS_NSEC3PARAM_DATA}
     */
    NSEC3PARAM{
        get {
            if(!this.HasProp("__NSEC3PARAM"))
                this.__NSEC3PARAM := DNS_NSEC3PARAM_DATA(this.ptr + 32)
            return this.__NSEC3PARAM
        }
    }

    /**
     * @type {DNS_NSEC3PARAM_DATA}
     */
    Nsec3Param1{
        get {
            if(!this.HasProp("__Nsec3Param1"))
                this.__Nsec3Param1 := DNS_NSEC3PARAM_DATA(this.ptr + 32)
            return this.__Nsec3Param1
        }
    }

    /**
     * @type {DNS_TLSA_DATA}
     */
    TLSA{
        get {
            if(!this.HasProp("__TLSA"))
                this.__TLSA := DNS_TLSA_DATA(this.ptr + 32)
            return this.__TLSA
        }
    }

    /**
     * @type {DNS_TLSA_DATA}
     */
    Tlsa1{
        get {
            if(!this.HasProp("__Tlsa1"))
                this.__Tlsa1 := DNS_TLSA_DATA(this.ptr + 32)
            return this.__Tlsa1
        }
    }

    /**
     * @type {DNS_SVCB_DATA}
     */
    SVCB{
        get {
            if(!this.HasProp("__SVCB"))
                this.__SVCB := DNS_SVCB_DATA(this.ptr + 32)
            return this.__SVCB
        }
    }

    /**
     * @type {DNS_SVCB_DATA}
     */
    Svcb1{
        get {
            if(!this.HasProp("__Svcb1"))
                this.__Svcb1 := DNS_SVCB_DATA(this.ptr + 32)
            return this.__Svcb1
        }
    }

    /**
     * @type {DNS_UNKNOWN_DATA}
     */
    UNKNOWN{
        get {
            if(!this.HasProp("__UNKNOWN"))
                this.__UNKNOWN := DNS_UNKNOWN_DATA(this.ptr + 32)
            return this.__UNKNOWN
        }
    }

    /**
     * @type {DNS_UNKNOWN_DATA}
     */
    Unknown1{
        get {
            if(!this.HasProp("__Unknown1"))
                this.__Unknown1 := DNS_UNKNOWN_DATA(this.ptr + 32)
            return this.__Unknown1
        }
    }

    /**
     * @type {Pointer<Byte>}
     */
    pDataPtr {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
