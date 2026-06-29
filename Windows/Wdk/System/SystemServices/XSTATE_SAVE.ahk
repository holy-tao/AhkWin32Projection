#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\System\Diagnostics\Debug\XSAVE_AREA.ahk" { XSAVE_AREA }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct XSTATE_SAVE {
    #StructPack 8

    Reserved1 : Int64

    Reserved2 : UInt32

    Prev : XSTATE_SAVE.Ptr

    Reserved3 : XSAVE_AREA.Ptr

    Thread : IntPtr

    Reserved4 : IntPtr

    Level : Int8

    static __New() {
        DefineProp(this.Prototype, 'XStateContext', { type: IntPtr, offset: 0 })
        this.DeleteProp("__New")
    }
}
