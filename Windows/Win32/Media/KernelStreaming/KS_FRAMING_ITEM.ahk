#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_FRAMING_RANGE.ahk" { KS_FRAMING_RANGE }
#Import ".\KS_FRAMING_RANGE_WEIGHTED.ahk" { KS_FRAMING_RANGE_WEIGHTED }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_FRAMING_ITEM {
    #StructPack 4

    MemoryType : Guid

    BusType : Guid

    MemoryFlags : UInt32

    BusFlags : UInt32

    Flags : UInt32

    Frames : UInt32

    FileAlignment : UInt32

    MemoryTypeWeight : UInt32

    PhysicalRange : KS_FRAMING_RANGE

    FramingRange : KS_FRAMING_RANGE_WEIGHTED

    static __New() {
        DefineProp(this.Prototype, 'FramePitch', { type: Int32, offset: 48 })
        this.DeleteProp("__New")
    }
}
