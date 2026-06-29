#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KD_NAMESPACE_ENUM.ahk" { KD_NAMESPACE_ENUM }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEBUGGING_DEVICE_IN_USE {
    #StructPack 8

    NameSpace : KD_NAMESPACE_ENUM

    StructureLength : UInt32

    AcpiDevice : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'PciDevice', { type: IntPtr, offset: 8 })
        this.DeleteProp("__New")
    }
}
