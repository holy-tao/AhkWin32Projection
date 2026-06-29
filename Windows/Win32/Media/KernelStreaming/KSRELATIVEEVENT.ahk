#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\KSEVENTDATA.ahk" { KSEVENTDATA }
#Import "..\..\..\..\Guid.ahk" { Guid }

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
