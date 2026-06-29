#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct COUNTED_REASON_CONTEXT {
    #StructPack 8

    Version : UInt32

    Flags : UInt32

    ResourceFileName : IntPtr

    ResourceReasonId : UInt16

    StringCount : UInt32

    ReasonStrings : UNICODE_STRING.Ptr

    static __New() {
        DefineProp(this.Prototype, 'SimpleString', { type: IntPtr, offset: 8 })
        this.DeleteProp("__New")
    }
}
