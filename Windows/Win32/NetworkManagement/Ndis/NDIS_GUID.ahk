#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_GUID {
    #StructPack 4

    Guid : Guid

    Oid : UInt32

    Size : UInt32

    Flags : UInt32

    static __New() {
        DefineProp(this.Prototype, 'Status', { type: Int32, offset: 16 })
        this.DeleteProp("__New")
    }
}
