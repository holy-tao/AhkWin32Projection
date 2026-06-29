#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN_ADDR.ahk" { IN_ADDR }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASTUNNELENDPOINT {
    #StructPack 4

    dwType : UInt32

    ipv4 : IN_ADDR

    static __New() {
        DefineProp(this.Prototype, 'ipv6', { type: IN6_ADDR, offset: 4 })
        this.DeleteProp("__New")
    }
}
