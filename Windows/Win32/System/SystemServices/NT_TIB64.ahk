#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct NT_TIB64 {
    #StructPack 8

    ExceptionList : Int64

    StackBase : Int64

    StackLimit : Int64

    SubSystemTib : Int64

    FiberData : Int64

    ArbitraryUserPointer : Int64

    Self : Int64

    static __New() {
        DefineProp(this.Prototype, 'Version', { type: UInt32, offset: 32 })
        this.DeleteProp("__New")
    }
}
