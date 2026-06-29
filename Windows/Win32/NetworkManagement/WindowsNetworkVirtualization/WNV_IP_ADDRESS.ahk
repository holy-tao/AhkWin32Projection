#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN_ADDR.ahk" { IN_ADDR }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }

/**
 * Defines an IP address object.
 * @remarks
 * The <b>ADDRESS_FAMILY</b> value is always specified separately in the structures that contain this IP address object.
 * @see https://learn.microsoft.com/windows/win32/api/wnvapi/ns-wnvapi-wnv_ip_address
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 */
export default struct WNV_IP_ADDRESS {
    #StructPack 4


    struct _IP {
        v4 : IN_ADDR

        static __New() {
            DefineProp(this.Prototype, 'v6', { type: IN6_ADDR, offset: 0 })
            DefineProp(this.Prototype, 'Addr', { type: Int8[16], offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * An IP version 4 (IPv4) or IP version 6 (IPv6) address object.
     */
    IP : WNV_IP_ADDRESS._IP

}
