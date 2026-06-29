#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DL_EUI48.ahk" { DL_EUI48 }
#Import ".\DL_OUI.ahk" { DL_OUI }
#Import ".\DL_EI48.ahk" { DL_EI48 }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ETHERNET_HEADER {
    #StructPack 2

    Destination : DL_EUI48

    Source : DL_EUI48

    Type : UInt16

    static __New() {
        DefineProp(this.Prototype, 'Length', { type: UInt16, offset: 26 })
        this.DeleteProp("__New")
    }
}
