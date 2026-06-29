#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a socket address.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_sockaddr
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_SOCKADDR {
    #StructPack 4


    struct _u {

        struct _ipv4 {
            sin_port : UInt16

            IN_ADDR : UInt32

            sin_zero : Int8[8]

        }

        struct _ipv6 {
            sin6_port : UInt16

            sin6_flowinfo : UInt32

            sin6_addr : UInt16[8]

            sin6_scope_id : UInt32

        }

        ipv4 : WTS_SOCKADDR._u._ipv4

        static __New() {
            DefineProp(this.Prototype, 'ipv6', { type: WTS_SOCKADDR._u._ipv6, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * An integer index into the following structure members.
     */
    sin_family : UInt16

    u : WTS_SOCKADDR._u

}
