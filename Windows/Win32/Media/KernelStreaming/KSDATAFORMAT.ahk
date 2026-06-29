#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSDATAFORMAT {
    #StructPack 8

    FormatSize : UInt32

    Flags : UInt32

    SampleSize : UInt32

    Reserved : UInt32

    MajorFormat : Guid

    SubFormat : Guid

    Specifier : Guid

    static __New() {
        DefineProp(this.Prototype, 'Alignment', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
