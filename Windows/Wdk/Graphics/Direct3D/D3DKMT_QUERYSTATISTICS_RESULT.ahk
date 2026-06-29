#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_RESULT {
    #StructPack 8

    AdapterInformation : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'PhysAdapterInformation', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'SegmentInformation', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'NodeInformation', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'VidPnSourceInformation', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'ProcessInformation', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'ProcessAdapterInformation', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'ProcessSegmentInformation', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'ProcessNodeInformation', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'ProcessVidPnSourceInformation', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'ProcessSegmentGroupInformation', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'SegmentUsageInformation', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'SegmentGroupUsageInformation', { type: IntPtr, offset: 0 })
        this.DeleteProp("__New")
    }
}
