#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IPNG_ADDRESS union provides Internet Protocol version 4 (IPv4) and Internet Protocol version 6 (IPv6) addresses.
 * @see https://learn.microsoft.com/windows/win32/api/madcapcl/ns-madcapcl-ipng_address
 * @namespace Windows.Win32.NetworkManagement.Multicast
 */
export default struct IPNG_ADDRESS {
    #StructPack 4

    /**
     * Internet Protocol (IP) address, in version 4 format (IPv4).
     */
    IpAddrV4 : UInt32

    static __New() {
        DefineProp(this.Prototype, 'IpAddrV6', { type: Int8[16], offset: 0 })
        this.DeleteProp("__New")
    }
}
