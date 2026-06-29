#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IP6_ADDRESS structure stores an IPv6 address. (IP6_ADDRESS)
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-ip6_address
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @architecture X64, Arm64
 */
export default struct IP6_ADDRESS {
    #StructPack 8

    IP6Qword : Int64[2]

    static __New() {
        DefineProp(this.Prototype, 'IP6Dword', { type: UInt32[4], offset: 0 })
        DefineProp(this.Prototype, 'IP6Word', { type: UInt16[8], offset: 0 })
        DefineProp(this.Prototype, 'IP6Byte', { type: Int8[16], offset: 0 })
        this.DeleteProp("__New")
    }
}
