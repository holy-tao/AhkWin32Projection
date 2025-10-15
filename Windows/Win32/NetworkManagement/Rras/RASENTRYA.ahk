#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RASIPADDR.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset ANSI
 */
class RASENTRYA extends Win32Struct
{
    static sizeof => 3480

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwfOptions {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwCountryID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwCountryCode {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {String}
     */
    szAreaCode {
        get => StrGet(this.ptr + 16, 10, "UTF-8")
        set => StrPut(value, this.ptr + 16, 10, "UTF-8")
    }

    /**
     * @type {String}
     */
    szLocalPhoneNumber {
        get => StrGet(this.ptr + 27, 128, "UTF-8")
        set => StrPut(value, this.ptr + 27, 128, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwAlternateOffset {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * @type {RASIPADDR}
     */
    ipaddr{
        get {
            if(!this.HasProp("__ipaddr"))
                this.__ipaddr := RASIPADDR(this.ptr + 160)
            return this.__ipaddr
        }
    }

    /**
     * @type {RASIPADDR}
     */
    ipaddrDns{
        get {
            if(!this.HasProp("__ipaddrDns"))
                this.__ipaddrDns := RASIPADDR(this.ptr + 164)
            return this.__ipaddrDns
        }
    }

    /**
     * @type {RASIPADDR}
     */
    ipaddrDnsAlt{
        get {
            if(!this.HasProp("__ipaddrDnsAlt"))
                this.__ipaddrDnsAlt := RASIPADDR(this.ptr + 168)
            return this.__ipaddrDnsAlt
        }
    }

    /**
     * @type {RASIPADDR}
     */
    ipaddrWins{
        get {
            if(!this.HasProp("__ipaddrWins"))
                this.__ipaddrWins := RASIPADDR(this.ptr + 172)
            return this.__ipaddrWins
        }
    }

    /**
     * @type {RASIPADDR}
     */
    ipaddrWinsAlt{
        get {
            if(!this.HasProp("__ipaddrWinsAlt"))
                this.__ipaddrWinsAlt := RASIPADDR(this.ptr + 176)
            return this.__ipaddrWinsAlt
        }
    }

    /**
     * @type {Integer}
     */
    dwFrameSize {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }

    /**
     * @type {Integer}
     */
    dwfNetProtocols {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    dwFramingProtocol {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * @type {String}
     */
    szScript {
        get => StrGet(this.ptr + 192, 259, "UTF-8")
        set => StrPut(value, this.ptr + 192, 259, "UTF-8")
    }

    /**
     * @type {String}
     */
    szAutodialDll {
        get => StrGet(this.ptr + 452, 259, "UTF-8")
        set => StrPut(value, this.ptr + 452, 259, "UTF-8")
    }

    /**
     * @type {String}
     */
    szAutodialFunc {
        get => StrGet(this.ptr + 712, 259, "UTF-8")
        set => StrPut(value, this.ptr + 712, 259, "UTF-8")
    }

    /**
     * @type {String}
     */
    szDeviceType {
        get => StrGet(this.ptr + 972, 16, "UTF-8")
        set => StrPut(value, this.ptr + 972, 16, "UTF-8")
    }

    /**
     * @type {String}
     */
    szDeviceName {
        get => StrGet(this.ptr + 989, 128, "UTF-8")
        set => StrPut(value, this.ptr + 989, 128, "UTF-8")
    }

    /**
     * @type {String}
     */
    szX25PadType {
        get => StrGet(this.ptr + 1118, 32, "UTF-8")
        set => StrPut(value, this.ptr + 1118, 32, "UTF-8")
    }

    /**
     * @type {String}
     */
    szX25Address {
        get => StrGet(this.ptr + 1151, 200, "UTF-8")
        set => StrPut(value, this.ptr + 1151, 200, "UTF-8")
    }

    /**
     * @type {String}
     */
    szX25Facilities {
        get => StrGet(this.ptr + 1352, 200, "UTF-8")
        set => StrPut(value, this.ptr + 1352, 200, "UTF-8")
    }

    /**
     * @type {String}
     */
    szX25UserData {
        get => StrGet(this.ptr + 1553, 200, "UTF-8")
        set => StrPut(value, this.ptr + 1553, 200, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwChannels {
        get => NumGet(this, 1756, "uint")
        set => NumPut("uint", value, this, 1756)
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 1760, "uint")
        set => NumPut("uint", value, this, 1760)
    }

    /**
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 1764, "uint")
        set => NumPut("uint", value, this, 1764)
    }

    /**
     * @type {Integer}
     */
    dwSubEntries {
        get => NumGet(this, 1768, "uint")
        set => NumPut("uint", value, this, 1768)
    }

    /**
     * @type {Integer}
     */
    dwDialMode {
        get => NumGet(this, 1772, "uint")
        set => NumPut("uint", value, this, 1772)
    }

    /**
     * @type {Integer}
     */
    dwDialExtraPercent {
        get => NumGet(this, 1776, "uint")
        set => NumPut("uint", value, this, 1776)
    }

    /**
     * @type {Integer}
     */
    dwDialExtraSampleSeconds {
        get => NumGet(this, 1780, "uint")
        set => NumPut("uint", value, this, 1780)
    }

    /**
     * @type {Integer}
     */
    dwHangUpExtraPercent {
        get => NumGet(this, 1784, "uint")
        set => NumPut("uint", value, this, 1784)
    }

    /**
     * @type {Integer}
     */
    dwHangUpExtraSampleSeconds {
        get => NumGet(this, 1788, "uint")
        set => NumPut("uint", value, this, 1788)
    }

    /**
     * @type {Integer}
     */
    dwIdleDisconnectSeconds {
        get => NumGet(this, 1792, "uint")
        set => NumPut("uint", value, this, 1792)
    }

    /**
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 1796, "uint")
        set => NumPut("uint", value, this, 1796)
    }

    /**
     * @type {Integer}
     */
    dwEncryptionType {
        get => NumGet(this, 1800, "uint")
        set => NumPut("uint", value, this, 1800)
    }

    /**
     * @type {Integer}
     */
    dwCustomAuthKey {
        get => NumGet(this, 1804, "uint")
        set => NumPut("uint", value, this, 1804)
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidId {
        get => NumGet(this, 1808, "ptr")
        set => NumPut("ptr", value, this, 1808)
    }

    /**
     * @type {String}
     */
    szCustomDialDll {
        get => StrGet(this.ptr + 1816, 259, "UTF-8")
        set => StrPut(value, this.ptr + 1816, 259, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwVpnStrategy {
        get => NumGet(this, 2076, "uint")
        set => NumPut("uint", value, this, 2076)
    }

    /**
     * @type {Integer}
     */
    dwfOptions2 {
        get => NumGet(this, 2080, "uint")
        set => NumPut("uint", value, this, 2080)
    }

    /**
     * @type {Integer}
     */
    dwfOptions3 {
        get => NumGet(this, 2084, "uint")
        set => NumPut("uint", value, this, 2084)
    }

    /**
     * @type {String}
     */
    szDnsSuffix {
        get => StrGet(this.ptr + 2088, 255, "UTF-8")
        set => StrPut(value, this.ptr + 2088, 255, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwTcpWindowSize {
        get => NumGet(this, 2344, "uint")
        set => NumPut("uint", value, this, 2344)
    }

    /**
     * @type {String}
     */
    szPrerequisitePbk {
        get => StrGet(this.ptr + 2348, 259, "UTF-8")
        set => StrPut(value, this.ptr + 2348, 259, "UTF-8")
    }

    /**
     * @type {String}
     */
    szPrerequisiteEntry {
        get => StrGet(this.ptr + 2608, 256, "UTF-8")
        set => StrPut(value, this.ptr + 2608, 256, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwRedialCount {
        get => NumGet(this, 2868, "uint")
        set => NumPut("uint", value, this, 2868)
    }

    /**
     * @type {Integer}
     */
    dwRedialPause {
        get => NumGet(this, 2872, "uint")
        set => NumPut("uint", value, this, 2872)
    }

    /**
     * @type {IN6_ADDR}
     */
    ipv6addrDns{
        get {
            if(!this.HasProp("__ipv6addrDns"))
                this.__ipv6addrDns := IN6_ADDR(this.ptr + 2880)
            return this.__ipv6addrDns
        }
    }

    /**
     * @type {IN6_ADDR}
     */
    ipv6addrDnsAlt{
        get {
            if(!this.HasProp("__ipv6addrDnsAlt"))
                this.__ipv6addrDnsAlt := IN6_ADDR(this.ptr + 2896)
            return this.__ipv6addrDnsAlt
        }
    }

    /**
     * @type {Integer}
     */
    dwIPv4InterfaceMetric {
        get => NumGet(this, 2912, "uint")
        set => NumPut("uint", value, this, 2912)
    }

    /**
     * @type {Integer}
     */
    dwIPv6InterfaceMetric {
        get => NumGet(this, 2916, "uint")
        set => NumPut("uint", value, this, 2916)
    }

    /**
     * @type {IN6_ADDR}
     */
    ipv6addr{
        get {
            if(!this.HasProp("__ipv6addr"))
                this.__ipv6addr := IN6_ADDR(this.ptr + 2920)
            return this.__ipv6addr
        }
    }

    /**
     * @type {Integer}
     */
    dwIPv6PrefixLength {
        get => NumGet(this, 2936, "uint")
        set => NumPut("uint", value, this, 2936)
    }

    /**
     * @type {Integer}
     */
    dwNetworkOutageTime {
        get => NumGet(this, 2940, "uint")
        set => NumPut("uint", value, this, 2940)
    }

    /**
     * @type {String}
     */
    szIDi {
        get => StrGet(this.ptr + 2944, 256, "UTF-8")
        set => StrPut(value, this.ptr + 2944, 256, "UTF-8")
    }

    /**
     * @type {String}
     */
    szIDr {
        get => StrGet(this.ptr + 3201, 256, "UTF-8")
        set => StrPut(value, this.ptr + 3201, 256, "UTF-8")
    }

    /**
     * @type {BOOL}
     */
    fIsImsConfig{
        get {
            if(!this.HasProp("__fIsImsConfig"))
                this.__fIsImsConfig := BOOL(this.ptr + 3460)
            return this.__fIsImsConfig
        }
    }

    /**
     * @type {Integer}
     */
    IdiType {
        get => NumGet(this, 3464, "int")
        set => NumPut("int", value, this, 3464)
    }

    /**
     * @type {Integer}
     */
    IdrType {
        get => NumGet(this, 3468, "int")
        set => NumPut("int", value, this, 3468)
    }

    /**
     * @type {BOOL}
     */
    fDisableIKEv2Fragmentation{
        get {
            if(!this.HasProp("__fDisableIKEv2Fragmentation"))
                this.__fDisableIKEv2Fragmentation := BOOL(this.ptr + 3472)
            return this.__fDisableIKEv2Fragmentation
        }
    }
}
