#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DL_EUI48.ahk" { DL_EUI48 }
#Import ".\IN_ADDR.ahk" { IN_ADDR }
#Import ".\DL_EUI64.ahk" { DL_EUI64 }
#Import ".\DL_EI64.ahk" { DL_EI64 }
#Import ".\DL_OUI.ahk" { DL_OUI }
#Import ".\DL_EI48.ahk" { DL_EI48 }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct DL_TEREDO_ADDRESS_PRV {
    #StructPack 1

    Reserved : Int8[6]

    Eui64 : DL_EUI64

    static __New() {
        DefineProp(this.Prototype, 'Flags', { type: UInt16, offset: 6 })
        DefineProp(this.Prototype, 'MappedPort', { type: UInt16, offset: 8 })
        DefineProp(this.Prototype, 'MappedAddress', { type: IN_ADDR, offset: 10 })
        DefineProp(this.Prototype, 'LocalAddress', { type: IN_ADDR, offset: 14 })
        DefineProp(this.Prototype, 'InterfaceIndex', { type: UInt32, offset: 18 })
        DefineProp(this.Prototype, 'LocalPort', { type: UInt16, offset: 22 })
        DefineProp(this.Prototype, 'DlDestination', { type: DL_EUI48, offset: 24 })
        this.DeleteProp("__New")
    }
}
