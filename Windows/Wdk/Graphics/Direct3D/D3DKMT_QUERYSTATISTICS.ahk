#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DKMT_MEMORY_SEGMENT_GROUP.ahk" { D3DKMT_MEMORY_SEGMENT_GROUP }
#Import ".\D3DKMT_QUERYSTATISTICS_TYPE.ahk" { D3DKMT_QUERYSTATISTICS_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS {
    #StructPack 8

    Type : D3DKMT_QUERYSTATISTICS_TYPE

    AdapterLuid : IntPtr

    hProcess : HANDLE

    QueryResult : IntPtr

    QuerySegment : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'QueryProcessSegment', { type: IntPtr, offset: 32 })
        DefineProp(this.Prototype, 'QueryProcessSegmentGroup', { type: D3DKMT_MEMORY_SEGMENT_GROUP, offset: 32 })
        DefineProp(this.Prototype, 'QueryNode', { type: IntPtr, offset: 32 })
        DefineProp(this.Prototype, 'QueryProcessNode', { type: IntPtr, offset: 32 })
        DefineProp(this.Prototype, 'QueryVidPnSource', { type: IntPtr, offset: 32 })
        DefineProp(this.Prototype, 'QueryProcessVidPnSource', { type: IntPtr, offset: 32 })
        DefineProp(this.Prototype, 'QueryPhysAdapter', { type: IntPtr, offset: 32 })
        DefineProp(this.Prototype, 'QueryAdapter2', { type: IntPtr, offset: 32 })
        DefineProp(this.Prototype, 'QuerySegment2', { type: IntPtr, offset: 32 })
        DefineProp(this.Prototype, 'QueryProcessAdapter2', { type: IntPtr, offset: 32 })
        DefineProp(this.Prototype, 'QueryProcessSegment2', { type: IntPtr, offset: 32 })
        DefineProp(this.Prototype, 'QueryProcessSegmentGroup2', { type: IntPtr, offset: 32 })
        DefineProp(this.Prototype, 'QuerySegmentUsage', { type: IntPtr, offset: 32 })
        DefineProp(this.Prototype, 'QuerySegmentGroupUsage', { type: IntPtr, offset: 32 })
        DefineProp(this.Prototype, 'QueryNode2', { type: IntPtr, offset: 32 })
        DefineProp(this.Prototype, 'QueryProcessNode2', { type: IntPtr, offset: 32 })
        this.DeleteProp("__New")
    }
}
