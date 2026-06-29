#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DL_OUI.ahk" { DL_OUI }
#Import ".\DL_EI48.ahk" { DL_EI48 }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct DL_EUI48 {
    #StructPack 1

    Byte : Int8[6]

    static __New() {
        DefineProp(this.Prototype, 'Oui', { type: DL_OUI, offset: 0 })
        DefineProp(this.Prototype, 'Ei48', { type: DL_EI48, offset: 4 })
        this.DeleteProp("__New")
    }
}
