#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EXCEPTION_REGISTRATION_RECORD.ahk" { EXCEPTION_REGISTRATION_RECORD }

/**
 * @namespace Windows.Win32.System.Kernel
 */
export default struct NT_TIB {
    #StructPack 8

    ExceptionList : EXCEPTION_REGISTRATION_RECORD.Ptr

    StackBase : IntPtr

    StackLimit : IntPtr

    SubSystemTib : IntPtr

    FiberData : IntPtr

    ArbitraryUserPointer : IntPtr

    Self : NT_TIB.Ptr

    static __New() {
        DefineProp(this.Prototype, 'Version', { type: UInt32, offset: 32 })
        this.DeleteProp("__New")
    }
}
