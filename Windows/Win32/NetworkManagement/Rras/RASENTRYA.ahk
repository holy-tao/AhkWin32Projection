#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include .\RASENTRY_DIAL_MODE.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\RASIPADDR.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\IKEV2_ID_PAYLOAD_TYPE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset ANSI
 */
class RASENTRYA extends Win32Struct {
    static sizeof => 3480

    static packingSize => 4

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
    ipaddr {
        get {
            if(!this.HasProp("__ipaddr"))
                this.__ipaddr := RASIPADDR(160, this)
            return this.__ipaddr
        }
    }

    /**
     * @type {RASIPADDR}
     */
    ipaddrDns {
        get {
            if(!this.HasProp("__ipaddrDns"))
                this.__ipaddrDns := RASIPADDR(164, this)
            return this.__ipaddrDns
        }
    }

    /**
     * @type {RASIPADDR}
     */
    ipaddrDnsAlt {
        get {
            if(!this.HasProp("__ipaddrDnsAlt"))
                this.__ipaddrDnsAlt := RASIPADDR(168, this)
            return this.__ipaddrDnsAlt
        }
    }

    /**
     * @type {RASIPADDR}
     */
    ipaddrWins {
        get {
            if(!this.HasProp("__ipaddrWins"))
                this.__ipaddrWins := RASIPADDR(172, this)
            return this.__ipaddrWins
        }
    }

    /**
     * @type {RASIPADDR}
     */
    ipaddrWinsAlt {
        get {
            if(!this.HasProp("__ipaddrWinsAlt"))
                this.__ipaddrWinsAlt := RASIPADDR(176, this)
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
     * @type {RASENTRY_DIAL_MODE}
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
     * @type {Guid}
     */
    guidId {
        get {
            if(!this.HasProp("__guidId"))
                this.__guidId := Guid(1808, this)
            return this.__guidId
        }
    }

    /**
     * @type {String}
     */
    szCustomDialDll {
        get => StrGet(this.ptr + 1824, 259, "UTF-8")
        set => StrPut(value, this.ptr + 1824, 259, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwVpnStrategy {
        get => NumGet(this, 2084, "uint")
        set => NumPut("uint", value, this, 2084)
    }

    /**
     * @type {Integer}
     */
    dwfOptions2 {
        get => NumGet(this, 2088, "uint")
        set => NumPut("uint", value, this, 2088)
    }

    /**
     * @type {Integer}
     */
    dwfOptions3 {
        get => NumGet(this, 2092, "uint")
        set => NumPut("uint", value, this, 2092)
    }

    /**
     * @type {String}
     */
    szDnsSuffix {
        get => StrGet(this.ptr + 2096, 255, "UTF-8")
        set => StrPut(value, this.ptr + 2096, 255, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwTcpWindowSize {
        get => NumGet(this, 2352, "uint")
        set => NumPut("uint", value, this, 2352)
    }

    /**
     * @type {String}
     */
    szPrerequisitePbk {
        get => StrGet(this.ptr + 2356, 259, "UTF-8")
        set => StrPut(value, this.ptr + 2356, 259, "UTF-8")
    }

    /**
     * @type {String}
     */
    szPrerequisiteEntry {
        get => StrGet(this.ptr + 2616, 256, "UTF-8")
        set => StrPut(value, this.ptr + 2616, 256, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwRedialCount {
        get => NumGet(this, 2876, "uint")
        set => NumPut("uint", value, this, 2876)
    }

    /**
     * @type {Integer}
     */
    dwRedialPause {
        get => NumGet(this, 2880, "uint")
        set => NumPut("uint", value, this, 2880)
    }

    /**
     * @type {IN6_ADDR}
     */
    ipv6addrDns {
        get {
            if(!this.HasProp("__ipv6addrDns"))
                this.__ipv6addrDns := IN6_ADDR(2884, this)
            return this.__ipv6addrDns
        }
    }

    /**
     * @type {IN6_ADDR}
     */
    ipv6addrDnsAlt {
        get {
            if(!this.HasProp("__ipv6addrDnsAlt"))
                this.__ipv6addrDnsAlt := IN6_ADDR(2900, this)
            return this.__ipv6addrDnsAlt
        }
    }

    /**
     * @type {Integer}
     */
    dwIPv4InterfaceMetric {
        get => NumGet(this, 2916, "uint")
        set => NumPut("uint", value, this, 2916)
    }

    /**
     * @type {Integer}
     */
    dwIPv6InterfaceMetric {
        get => NumGet(this, 2920, "uint")
        set => NumPut("uint", value, this, 2920)
    }

    /**
     * @type {IN6_ADDR}
     */
    ipv6addr {
        get {
            if(!this.HasProp("__ipv6addr"))
                this.__ipv6addr := IN6_ADDR(2924, this)
            return this.__ipv6addr
        }
    }

    /**
     * @type {Integer}
     */
    dwIPv6PrefixLength {
        get => NumGet(this, 2940, "uint")
        set => NumPut("uint", value, this, 2940)
    }

    /**
     * @type {Integer}
     */
    dwNetworkOutageTime {
        get => NumGet(this, 2944, "uint")
        set => NumPut("uint", value, this, 2944)
    }

    /**
     * @type {String}
     */
    szIDi {
        get => StrGet(this.ptr + 2948, 256, "UTF-8")
        set => StrPut(value, this.ptr + 2948, 256, "UTF-8")
    }

    /**
     * @type {String}
     */
    szIDr {
        get => StrGet(this.ptr + 3205, 256, "UTF-8")
        set => StrPut(value, this.ptr + 3205, 256, "UTF-8")
    }

    /**
     * @type {BOOL}
     */
    fIsImsConfig {
        get => NumGet(this, 3464, "int")
        set => NumPut("int", value, this, 3464)
    }

    /**
     * @type {IKEV2_ID_PAYLOAD_TYPE}
     */
    IdiType {
        get => NumGet(this, 3468, "int")
        set => NumPut("int", value, this, 3468)
    }

    /**
     * @type {IKEV2_ID_PAYLOAD_TYPE}
     */
    IdrType {
        get => NumGet(this, 3472, "int")
        set => NumPut("int", value, this, 3472)
    }

    /**
     * @type {BOOL}
     */
    fDisableIKEv2Fragmentation {
        get => NumGet(this, 3476, "int")
        set => NumPut("int", value, this, 3476)
    }
}
