#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct NT_TIB32 {
    #StructPack 4

    ExceptionList : UInt32

    StackBase : UInt32

    StackLimit : UInt32

    SubSystemTib : UInt32

    FiberData : UInt32

    ArbitraryUserPointer : UInt32

    Self : UInt32

    static __New() {
        DefineProp(this.Prototype, 'Version', { type: UInt32, offset: 16 })
        this.DeleteProp("__New")
    }
}
