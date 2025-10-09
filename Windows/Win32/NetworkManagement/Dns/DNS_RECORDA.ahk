#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DNS_SOA_DATAA.ahk
#Include .\DNS_MINFO_DATAA.ahk
#Include .\DNS_MX_DATAA.ahk
#Include .\DNS_TXT_DATAA.ahk
#Include .\DNS_NULL_DATA.ahk
#Include .\DNS_WKS_DATA.ahk
#Include .\IP6_ADDRESS.ahk
#Include .\DNS_AAAA_DATA.ahk
#Include .\DNS_KEY_DATA.ahk
#Include .\DNS_SIG_DATAA.ahk
#Include .\DNS_ATMA_DATA.ahk
#Include .\DNS_NXT_DATAA.ahk
#Include .\DNS_SRV_DATAA.ahk
#Include .\DNS_NAPTR_DATAA.ahk
#Include .\DNS_OPT_DATA.ahk
#Include .\DNS_DS_DATA.ahk
#Include .\DNS_NSEC_DATAA.ahk
#Include .\DNS_TKEY_DATAA.ahk
#Include .\DNS_TSIG_DATAA.ahk
#Include .\DNS_WINS_DATA.ahk
#Include .\DNS_WINSR_DATAA.ahk
#Include .\DNS_DHCID_DATA.ahk
#Include .\DNS_NSEC3_DATA.ahk
#Include .\DNS_NSEC3PARAM_DATA.ahk
#Include .\DNS_TLSA_DATA.ahk
#Include .\DNS_SVCB_DATA.ahk
#Include .\DNS_UNKNOWN_DATA.ahk

/**
 * Stores a DNS resource record (RR). (ANSI)
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
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 * @charset ANSI
 */
class DNS_RECORDA extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * A pointer to the next 
     * <b>DNS_RECORD</b> structure.
     * @type {Pointer<DNS_RECORDA>}
     */
    pNext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a string that represents the domain name of the record set. This must be in the string format that corresponds to the function called, such as ANSI, Unicode, or UTF8.
     * @type {Pointer<Byte>}
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
     * @type {DNS_SOA_DATAA}
     */
    SOA{
        get {
            if(!this.HasProp("__SOA"))
                this.__SOA := DNS_SOA_DATAA(this.ptr + 32)
            return this.__SOA
        }
    }

    /**
     * @type {Pointer<Byte>}
     */
    PTR {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Byte>}
     */
    NS {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Byte>}
     */
    CNAME {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Byte>}
     */
    DNAME {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Byte>}
     */
    MB {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Byte>}
     */
    MD {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Byte>}
     */
    MF {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Byte>}
     */
    MG {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Byte>}
     */
    MR {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {DNS_MINFO_DATAA}
     */
    MINFO{
        get {
            if(!this.HasProp("__MINFO"))
                this.__MINFO := DNS_MINFO_DATAA(this.ptr + 32)
            return this.__MINFO
        }
    }

    /**
     * @type {DNS_MINFO_DATAA}
     */
    RP{
        get {
            if(!this.HasProp("__RP"))
                this.__RP := DNS_MINFO_DATAA(this.ptr + 32)
            return this.__RP
        }
    }

    /**
     * @type {DNS_MX_DATAA}
     */
    MX{
        get {
            if(!this.HasProp("__MX"))
                this.__MX := DNS_MX_DATAA(this.ptr + 32)
            return this.__MX
        }
    }

    /**
     * @type {DNS_MX_DATAA}
     */
    AFSDB{
        get {
            if(!this.HasProp("__AFSDB"))
                this.__AFSDB := DNS_MX_DATAA(this.ptr + 32)
            return this.__AFSDB
        }
    }

    /**
     * @type {DNS_MX_DATAA}
     */
    RT{
        get {
            if(!this.HasProp("__RT"))
                this.__RT := DNS_MX_DATAA(this.ptr + 32)
            return this.__RT
        }
    }

    /**
     * @type {DNS_TXT_DATAA}
     */
    HINFO{
        get {
            if(!this.HasProp("__HINFO"))
                this.__HINFO := DNS_TXT_DATAA(this.ptr + 32)
            return this.__HINFO
        }
    }

    /**
     * @type {DNS_TXT_DATAA}
     */
    ISDN{
        get {
            if(!this.HasProp("__ISDN"))
                this.__ISDN := DNS_TXT_DATAA(this.ptr + 32)
            return this.__ISDN
        }
    }

    /**
     * @type {DNS_TXT_DATAA}
     */
    TXT{
        get {
            if(!this.HasProp("__TXT"))
                this.__TXT := DNS_TXT_DATAA(this.ptr + 32)
            return this.__TXT
        }
    }

    /**
     * @type {DNS_TXT_DATAA}
     */
    X25{
        get {
            if(!this.HasProp("__X25"))
                this.__X25 := DNS_TXT_DATAA(this.ptr + 32)
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
     * @type {DNS_SIG_DATAA}
     */
    SIG{
        get {
            if(!this.HasProp("__SIG"))
                this.__SIG := DNS_SIG_DATAA(this.ptr + 32)
            return this.__SIG
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
     * @type {DNS_NXT_DATAA}
     */
    NXT{
        get {
            if(!this.HasProp("__NXT"))
                this.__NXT := DNS_NXT_DATAA(this.ptr + 32)
            return this.__NXT
        }
    }

    /**
     * @type {DNS_SRV_DATAA}
     */
    SRV{
        get {
            if(!this.HasProp("__SRV"))
                this.__SRV := DNS_SRV_DATAA(this.ptr + 32)
            return this.__SRV
        }
    }

    /**
     * @type {DNS_NAPTR_DATAA}
     */
    NAPTR{
        get {
            if(!this.HasProp("__NAPTR"))
                this.__NAPTR := DNS_NAPTR_DATAA(this.ptr + 32)
            return this.__NAPTR
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
     * @type {DNS_SIG_DATAA}
     */
    RRSIG{
        get {
            if(!this.HasProp("__RRSIG"))
                this.__RRSIG := DNS_SIG_DATAA(this.ptr + 32)
            return this.__RRSIG
        }
    }

    /**
     * @type {DNS_NSEC_DATAA}
     */
    NSEC{
        get {
            if(!this.HasProp("__NSEC"))
                this.__NSEC := DNS_NSEC_DATAA(this.ptr + 32)
            return this.__NSEC
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
     * @type {DNS_TKEY_DATAA}
     */
    TKEY{
        get {
            if(!this.HasProp("__TKEY"))
                this.__TKEY := DNS_TKEY_DATAA(this.ptr + 32)
            return this.__TKEY
        }
    }

    /**
     * @type {DNS_TSIG_DATAA}
     */
    TSIG{
        get {
            if(!this.HasProp("__TSIG"))
                this.__TSIG := DNS_TSIG_DATAA(this.ptr + 32)
            return this.__TSIG
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
     * @type {DNS_WINSR_DATAA}
     */
    WINSR{
        get {
            if(!this.HasProp("__WINSR"))
                this.__WINSR := DNS_WINSR_DATAA(this.ptr + 32)
            return this.__WINSR
        }
    }

    /**
     * @type {DNS_WINSR_DATAA}
     */
    NBSTAT{
        get {
            if(!this.HasProp("__NBSTAT"))
                this.__NBSTAT := DNS_WINSR_DATAA(this.ptr + 32)
            return this.__NBSTAT
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
     * @type {Pointer<Byte>}
     */
    pDataPtr {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
