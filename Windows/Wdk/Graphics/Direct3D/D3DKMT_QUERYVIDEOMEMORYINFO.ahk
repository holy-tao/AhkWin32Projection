#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DKMT_MEMORY_SEGMENT_GROUP.ahk" { D3DKMT_MEMORY_SEGMENT_GROUP }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYVIDEOMEMORYINFO {
    #StructPack 8

    hProcess : HANDLE

    hAdapter : UInt32

    MemorySegmentGroup : D3DKMT_MEMORY_SEGMENT_GROUP

    Budget : Int64

    CurrentUsage : Int64

    CurrentReservation : Int64

    AvailableForReservation : Int64

    PhysicalAdapterIndex : UInt32

}
