#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSEVENTDATA.ahk" { KSEVENTDATA }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSRELATIVEEVENT {
    #StructPack 8

    Size : UInt32

    Flags : UInt32

    ObjectHandle : HANDLE

    Reserved : IntPtr

    Event : KSIDENTIFIER

    EventData : KSEVENTDATA

    static __New() {
        DefineProp(this.Prototype, 'ObjectPointer', { type: IntPtr, offset: 8 })
        this.DeleteProp("__New")
    }
}
