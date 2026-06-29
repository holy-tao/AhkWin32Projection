#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DL_EI64.ahk" { DL_EI64 }
#Import ".\DL_OUI.ahk" { DL_OUI }
#Import ".\DL_EI48.ahk" { DL_EI48 }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct DL_EUI64 {
    #StructPack 8

    Byte : Int8[8]

    static __New() {
        DefineProp(this.Prototype, 'Value', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'Oui', { type: DL_OUI, offset: 0 })
        DefineProp(this.Prototype, 'Ei64', { type: DL_EI64, offset: 4 })
        DefineProp(this.Prototype, 'Type', { type: Int8, offset: 4 })
        DefineProp(this.Prototype, 'Tse', { type: Int8, offset: 5 })
        DefineProp(this.Prototype, 'Ei48', { type: DL_EI48, offset: 6 })
        this.DeleteProp("__New")
    }
}
