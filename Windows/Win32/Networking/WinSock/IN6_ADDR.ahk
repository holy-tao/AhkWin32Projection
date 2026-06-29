#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IN6_ADDR structure specifies an IPv6 transport address.
 * @remarks
 * All members of the IN6_ADDR structure must be specified in network-byte-order (big-endian).
 * @see https://learn.microsoft.com/windows/win32/api/in6addr/ns-in6addr-in6_addr
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IN6_ADDR {
    #StructPack 2


    struct _u {
        Byte : Int8[16]

        static __New() {
            DefineProp(this.Prototype, 'Word', { type: UInt16[8], offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * A union that contains the following different representations of the IPv6 transport
     *      address:
     */
    u : IN6_ADDR._u

}
