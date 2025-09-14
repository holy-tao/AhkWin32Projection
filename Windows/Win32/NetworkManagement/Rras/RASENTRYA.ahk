#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RASIPADDR.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk

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
     * @type {Array<SByte>}
     */
    szAreaCode{
        get {
            if(!this.HasProp("__szAreaCodeProxyArray"))
                this.__szAreaCodeProxyArray := Win32FixedArray(this.ptr + 16, 11, Primitive, "char")
            return this.__szAreaCodeProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szLocalPhoneNumber{
        get {
            if(!this.HasProp("__szLocalPhoneNumberProxyArray"))
                this.__szLocalPhoneNumberProxyArray := Win32FixedArray(this.ptr + 27, 129, Primitive, "char")
            return this.__szLocalPhoneNumberProxyArray
        }
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
     * @type {Array<SByte>}
     */
    szScript{
        get {
            if(!this.HasProp("__szScriptProxyArray"))
                this.__szScriptProxyArray := Win32FixedArray(this.ptr + 192, 260, Primitive, "char")
            return this.__szScriptProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szAutodialDll{
        get {
            if(!this.HasProp("__szAutodialDllProxyArray"))
                this.__szAutodialDllProxyArray := Win32FixedArray(this.ptr + 452, 260, Primitive, "char")
            return this.__szAutodialDllProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szAutodialFunc{
        get {
            if(!this.HasProp("__szAutodialFuncProxyArray"))
                this.__szAutodialFuncProxyArray := Win32FixedArray(this.ptr + 712, 260, Primitive, "char")
            return this.__szAutodialFuncProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szDeviceType{
        get {
            if(!this.HasProp("__szDeviceTypeProxyArray"))
                this.__szDeviceTypeProxyArray := Win32FixedArray(this.ptr + 972, 17, Primitive, "char")
            return this.__szDeviceTypeProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szDeviceName{
        get {
            if(!this.HasProp("__szDeviceNameProxyArray"))
                this.__szDeviceNameProxyArray := Win32FixedArray(this.ptr + 989, 129, Primitive, "char")
            return this.__szDeviceNameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szX25PadType{
        get {
            if(!this.HasProp("__szX25PadTypeProxyArray"))
                this.__szX25PadTypeProxyArray := Win32FixedArray(this.ptr + 1118, 33, Primitive, "char")
            return this.__szX25PadTypeProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szX25Address{
        get {
            if(!this.HasProp("__szX25AddressProxyArray"))
                this.__szX25AddressProxyArray := Win32FixedArray(this.ptr + 1151, 201, Primitive, "char")
            return this.__szX25AddressProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szX25Facilities{
        get {
            if(!this.HasProp("__szX25FacilitiesProxyArray"))
                this.__szX25FacilitiesProxyArray := Win32FixedArray(this.ptr + 1352, 201, Primitive, "char")
            return this.__szX25FacilitiesProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szX25UserData{
        get {
            if(!this.HasProp("__szX25UserDataProxyArray"))
                this.__szX25UserDataProxyArray := Win32FixedArray(this.ptr + 1553, 201, Primitive, "char")
            return this.__szX25UserDataProxyArray
        }
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
     * @type {Array<SByte>}
     */
    szCustomDialDll{
        get {
            if(!this.HasProp("__szCustomDialDllProxyArray"))
                this.__szCustomDialDllProxyArray := Win32FixedArray(this.ptr + 1816, 260, Primitive, "char")
            return this.__szCustomDialDllProxyArray
        }
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
     * @type {Array<SByte>}
     */
    szDnsSuffix{
        get {
            if(!this.HasProp("__szDnsSuffixProxyArray"))
                this.__szDnsSuffixProxyArray := Win32FixedArray(this.ptr + 2088, 256, Primitive, "char")
            return this.__szDnsSuffixProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwTcpWindowSize {
        get => NumGet(this, 2344, "uint")
        set => NumPut("uint", value, this, 2344)
    }

    /**
     * @type {Array<SByte>}
     */
    szPrerequisitePbk{
        get {
            if(!this.HasProp("__szPrerequisitePbkProxyArray"))
                this.__szPrerequisitePbkProxyArray := Win32FixedArray(this.ptr + 2348, 260, Primitive, "char")
            return this.__szPrerequisitePbkProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szPrerequisiteEntry{
        get {
            if(!this.HasProp("__szPrerequisiteEntryProxyArray"))
                this.__szPrerequisiteEntryProxyArray := Win32FixedArray(this.ptr + 2608, 257, Primitive, "char")
            return this.__szPrerequisiteEntryProxyArray
        }
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
     * @type {Array<SByte>}
     */
    szIDi{
        get {
            if(!this.HasProp("__szIDiProxyArray"))
                this.__szIDiProxyArray := Win32FixedArray(this.ptr + 2944, 257, Primitive, "char")
            return this.__szIDiProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szIDr{
        get {
            if(!this.HasProp("__szIDrProxyArray"))
                this.__szIDrProxyArray := Win32FixedArray(this.ptr + 3201, 257, Primitive, "char")
            return this.__szIDrProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    fIsImsConfig {
        get => NumGet(this, 3460, "int")
        set => NumPut("int", value, this, 3460)
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
     * @type {Integer}
     */
    fDisableIKEv2Fragmentation {
        get => NumGet(this, 3472, "int")
        set => NumPut("int", value, this, 3472)
    }
}
