#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct KDPC {
    #StructPack 8

    TargetInfoAsUlong : UInt32

    DpcListEntry : IntPtr

    ProcessorHistory : IntPtr

    DeferredRoutine : IntPtr

    DeferredContext : IntPtr

    SystemArgument1 : IntPtr

    SystemArgument2 : IntPtr

    DpcData : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'Type', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'Importance', { type: Int8, offset: 1 })
        DefineProp(this.Prototype, 'Number', { type: UInt16, offset: 2 })
        this.DeleteProp("__New")
    }
}
