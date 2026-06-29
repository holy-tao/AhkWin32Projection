#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NPI_MODULEID_TYPE.ahk" { NPI_MODULEID_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LUID.ahk" { LUID }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct NPI_MODULEID {
    #StructPack 4

    Length : UInt16

    Type : NPI_MODULEID_TYPE

    Guid : Guid

    static __New() {
        DefineProp(this.Prototype, 'IfLuid', { type: LUID, offset: 8 })
        this.DeleteProp("__New")
    }
}
