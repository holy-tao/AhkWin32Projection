#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN_ADDR.ahk" { IN_ADDR }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct VPN_TS_IP_ADDRESS {
    #StructPack 4

    Type : UInt16

    v4 : IN_ADDR

    static __New() {
        DefineProp(this.Prototype, 'v6', { type: IN6_ADDR, offset: 4 })
        this.DeleteProp("__New")
    }
}
