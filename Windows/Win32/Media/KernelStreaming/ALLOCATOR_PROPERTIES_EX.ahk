#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PIPE_TERMINATION.ahk" { PIPE_TERMINATION }
#Import ".\KS_COMPRESSION.ahk" { KS_COMPRESSION }
#Import ".\PIPE_STATE.ahk" { PIPE_STATE }
#Import ".\IKsAllocatorEx.ahk" { IKsAllocatorEx }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KS_FRAMING_RANGE_WEIGHTED.ahk" { KS_FRAMING_RANGE_WEIGHTED }
#Import ".\KS_FRAMING_RANGE.ahk" { KS_FRAMING_RANGE }
#Import ".\PIPE_ALLOCATOR_PLACE.ahk" { PIPE_ALLOCATOR_PLACE }
#Import ".\PIPE_DIMENSIONS.ahk" { PIPE_DIMENSIONS }
#Import ".\KS_LogicalMemoryType.ahk" { KS_LogicalMemoryType }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct ALLOCATOR_PROPERTIES_EX {
    #StructPack 8

    cBuffers : Int32

    cbBuffer : Int32

    cbAlign : Int32

    cbPrefix : Int32

    MemoryType : Guid

    BusType : Guid

    State : PIPE_STATE

    Input : PIPE_TERMINATION

    Output : PIPE_TERMINATION

    Strategy : UInt32

    Flags : UInt32

    Weight : UInt32

    LogicalMemoryType : KS_LogicalMemoryType

    AllocatorPlace : PIPE_ALLOCATOR_PLACE

    Dimensions : PIPE_DIMENSIONS

    PhysicalRange : KS_FRAMING_RANGE

    PrevSegment : IKsAllocatorEx

    CountNextSegments : UInt32

    NextSegments : IKsAllocatorEx.Ptr

    InsideFactors : UInt32

    NumberPins : UInt32

}
