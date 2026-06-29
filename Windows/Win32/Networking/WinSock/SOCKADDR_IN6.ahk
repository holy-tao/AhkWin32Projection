#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN6_ADDR.ahk" { IN6_ADDR }
#Import ".\SCOPE_ID.ahk" { SCOPE_ID }
#Import ".\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKADDR_IN6 {
    #StructPack 4

    sin6_family : ADDRESS_FAMILY

    sin6_port : UInt16

    sin6_flowinfo : UInt32

    sin6_addr : IN6_ADDR

    sin6_scope_id : UInt32

    static __New() {
        DefineProp(this.Prototype, 'sin6_scope_struct', { type: SCOPE_ID, offset: 24 })
        this.DeleteProp("__New")
    }
}
