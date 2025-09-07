#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RASIPADDR.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset Unicode
 */
class RASENTRYW extends Win32Struct
{
    static sizeof => 6728

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
        get => StrGet(this.ptr + 16, 10, "UTF-16")
        set => StrPut(value, this.ptr + 16, 10, "UTF-16")
    }

    /**
     * @type {String}
     */
    szLocalPhoneNumber {
        get => StrGet(this.ptr + 38, 128, "UTF-16")
        set => StrPut(value, this.ptr + 38, 128, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwAlternateOffset {
        get => NumGet(this, 296, "uint")
        set => NumPut("uint", value, this, 296)
    }

    /**
     * @type {RASIPADDR}
     */
    ipaddr{
        get {
            if(!this.HasProp("__ipaddr"))
                this.__ipaddr := RASIPADDR(this.ptr + 300)
            return this.__ipaddr
        }
    }

    /**
     * @type {RASIPADDR}
     */
    ipaddrDns{
        get {
            if(!this.HasProp("__ipaddrDns"))
                this.__ipaddrDns := RASIPADDR(this.ptr + 304)
            return this.__ipaddrDns
        }
    }

    /**
     * @type {RASIPADDR}
     */
    ipaddrDnsAlt{
        get {
            if(!this.HasProp("__ipaddrDnsAlt"))
                this.__ipaddrDnsAlt := RASIPADDR(this.ptr + 308)
            return this.__ipaddrDnsAlt
        }
    }

    /**
     * @type {RASIPADDR}
     */
    ipaddrWins{
        get {
            if(!this.HasProp("__ipaddrWins"))
                this.__ipaddrWins := RASIPADDR(this.ptr + 312)
            return this.__ipaddrWins
        }
    }

    /**
     * @type {RASIPADDR}
     */
    ipaddrWinsAlt{
        get {
            if(!this.HasProp("__ipaddrWinsAlt"))
                this.__ipaddrWinsAlt := RASIPADDR(this.ptr + 316)
            return this.__ipaddrWinsAlt
        }
    }

    /**
     * @type {Integer}
     */
    dwFrameSize {
        get => NumGet(this, 320, "uint")
        set => NumPut("uint", value, this, 320)
    }

    /**
     * @type {Integer}
     */
    dwfNetProtocols {
        get => NumGet(this, 324, "uint")
        set => NumPut("uint", value, this, 324)
    }

    /**
     * @type {Integer}
     */
    dwFramingProtocol {
        get => NumGet(this, 328, "uint")
        set => NumPut("uint", value, this, 328)
    }

    /**
     * @type {String}
     */
    szScript {
        get => StrGet(this.ptr + 332, 259, "UTF-16")
        set => StrPut(value, this.ptr + 332, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    szAutodialDll {
        get => StrGet(this.ptr + 852, 259, "UTF-16")
        set => StrPut(value, this.ptr + 852, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    szAutodialFunc {
        get => StrGet(this.ptr + 1372, 259, "UTF-16")
        set => StrPut(value, this.ptr + 1372, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    szDeviceType {
        get => StrGet(this.ptr + 1892, 16, "UTF-16")
        set => StrPut(value, this.ptr + 1892, 16, "UTF-16")
    }

    /**
     * @type {String}
     */
    szDeviceName {
        get => StrGet(this.ptr + 1926, 128, "UTF-16")
        set => StrPut(value, this.ptr + 1926, 128, "UTF-16")
    }

    /**
     * @type {String}
     */
    szX25PadType {
        get => StrGet(this.ptr + 2184, 32, "UTF-16")
        set => StrPut(value, this.ptr + 2184, 32, "UTF-16")
    }

    /**
     * @type {String}
     */
    szX25Address {
        get => StrGet(this.ptr + 2250, 200, "UTF-16")
        set => StrPut(value, this.ptr + 2250, 200, "UTF-16")
    }

    /**
     * @type {String}
     */
    szX25Facilities {
        get => StrGet(this.ptr + 2652, 200, "UTF-16")
        set => StrPut(value, this.ptr + 2652, 200, "UTF-16")
    }

    /**
     * @type {String}
     */
    szX25UserData {
        get => StrGet(this.ptr + 3054, 200, "UTF-16")
        set => StrPut(value, this.ptr + 3054, 200, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwChannels {
        get => NumGet(this, 3456, "uint")
        set => NumPut("uint", value, this, 3456)
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 3460, "uint")
        set => NumPut("uint", value, this, 3460)
    }

    /**
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 3464, "uint")
        set => NumPut("uint", value, this, 3464)
    }

    /**
     * @type {Integer}
     */
    dwSubEntries {
        get => NumGet(this, 3468, "uint")
        set => NumPut("uint", value, this, 3468)
    }

    /**
     * @type {Integer}
     */
    dwDialMode {
        get => NumGet(this, 3472, "uint")
        set => NumPut("uint", value, this, 3472)
    }

    /**
     * @type {Integer}
     */
    dwDialExtraPercent {
        get => NumGet(this, 3476, "uint")
        set => NumPut("uint", value, this, 3476)
    }

    /**
     * @type {Integer}
     */
    dwDialExtraSampleSeconds {
        get => NumGet(this, 3480, "uint")
        set => NumPut("uint", value, this, 3480)
    }

    /**
     * @type {Integer}
     */
    dwHangUpExtraPercent {
        get => NumGet(this, 3484, "uint")
        set => NumPut("uint", value, this, 3484)
    }

    /**
     * @type {Integer}
     */
    dwHangUpExtraSampleSeconds {
        get => NumGet(this, 3488, "uint")
        set => NumPut("uint", value, this, 3488)
    }

    /**
     * @type {Integer}
     */
    dwIdleDisconnectSeconds {
        get => NumGet(this, 3492, "uint")
        set => NumPut("uint", value, this, 3492)
    }

    /**
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 3496, "uint")
        set => NumPut("uint", value, this, 3496)
    }

    /**
     * @type {Integer}
     */
    dwEncryptionType {
        get => NumGet(this, 3500, "uint")
        set => NumPut("uint", value, this, 3500)
    }

    /**
     * @type {Integer}
     */
    dwCustomAuthKey {
        get => NumGet(this, 3504, "uint")
        set => NumPut("uint", value, this, 3504)
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidId {
        get => NumGet(this, 3512, "ptr")
        set => NumPut("ptr", value, this, 3512)
    }

    /**
     * @type {String}
     */
    szCustomDialDll {
        get => StrGet(this.ptr + 3520, 259, "UTF-16")
        set => StrPut(value, this.ptr + 3520, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwVpnStrategy {
        get => NumGet(this, 4040, "uint")
        set => NumPut("uint", value, this, 4040)
    }

    /**
     * @type {Integer}
     */
    dwfOptions2 {
        get => NumGet(this, 4044, "uint")
        set => NumPut("uint", value, this, 4044)
    }

    /**
     * @type {Integer}
     */
    dwfOptions3 {
        get => NumGet(this, 4048, "uint")
        set => NumPut("uint", value, this, 4048)
    }

    /**
     * @type {String}
     */
    szDnsSuffix {
        get => StrGet(this.ptr + 4052, 255, "UTF-16")
        set => StrPut(value, this.ptr + 4052, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwTcpWindowSize {
        get => NumGet(this, 4564, "uint")
        set => NumPut("uint", value, this, 4564)
    }

    /**
     * @type {String}
     */
    szPrerequisitePbk {
        get => StrGet(this.ptr + 4568, 259, "UTF-16")
        set => StrPut(value, this.ptr + 4568, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    szPrerequisiteEntry {
        get => StrGet(this.ptr + 5088, 256, "UTF-16")
        set => StrPut(value, this.ptr + 5088, 256, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwRedialCount {
        get => NumGet(this, 5604, "uint")
        set => NumPut("uint", value, this, 5604)
    }

    /**
     * @type {Integer}
     */
    dwRedialPause {
        get => NumGet(this, 5608, "uint")
        set => NumPut("uint", value, this, 5608)
    }

    /**
     * @type {IN6_ADDR}
     */
    ipv6addrDns{
        get {
            if(!this.HasProp("__ipv6addrDns"))
                this.__ipv6addrDns := IN6_ADDR(this.ptr + 5616)
            return this.__ipv6addrDns
        }
    }

    /**
     * @type {IN6_ADDR}
     */
    ipv6addrDnsAlt{
        get {
            if(!this.HasProp("__ipv6addrDnsAlt"))
                this.__ipv6addrDnsAlt := IN6_ADDR(this.ptr + 5632)
            return this.__ipv6addrDnsAlt
        }
    }

    /**
     * @type {Integer}
     */
    dwIPv4InterfaceMetric {
        get => NumGet(this, 5648, "uint")
        set => NumPut("uint", value, this, 5648)
    }

    /**
     * @type {Integer}
     */
    dwIPv6InterfaceMetric {
        get => NumGet(this, 5652, "uint")
        set => NumPut("uint", value, this, 5652)
    }

    /**
     * @type {IN6_ADDR}
     */
    ipv6addr{
        get {
            if(!this.HasProp("__ipv6addr"))
                this.__ipv6addr := IN6_ADDR(this.ptr + 5656)
            return this.__ipv6addr
        }
    }

    /**
     * @type {Integer}
     */
    dwIPv6PrefixLength {
        get => NumGet(this, 5672, "uint")
        set => NumPut("uint", value, this, 5672)
    }

    /**
     * @type {Integer}
     */
    dwNetworkOutageTime {
        get => NumGet(this, 5676, "uint")
        set => NumPut("uint", value, this, 5676)
    }

    /**
     * @type {String}
     */
    szIDi {
        get => StrGet(this.ptr + 5680, 256, "UTF-16")
        set => StrPut(value, this.ptr + 5680, 256, "UTF-16")
    }

    /**
     * @type {String}
     */
    szIDr {
        get => StrGet(this.ptr + 6194, 256, "UTF-16")
        set => StrPut(value, this.ptr + 6194, 256, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    fIsImsConfig {
        get => NumGet(this, 6708, "int")
        set => NumPut("int", value, this, 6708)
    }

    /**
     * @type {Integer}
     */
    IdiType {
        get => NumGet(this, 6712, "int")
        set => NumPut("int", value, this, 6712)
    }

    /**
     * @type {Integer}
     */
    IdrType {
        get => NumGet(this, 6716, "int")
        set => NumPut("int", value, this, 6716)
    }

    /**
     * @type {Integer}
     */
    fDisableIKEv2Fragmentation {
        get => NumGet(this, 6720, "int")
        set => NumPut("int", value, this, 6720)
    }
}
