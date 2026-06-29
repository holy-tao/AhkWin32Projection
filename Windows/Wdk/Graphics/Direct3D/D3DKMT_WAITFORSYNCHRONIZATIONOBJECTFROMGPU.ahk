#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_WAITFORSYNCHRONIZATIONOBJECTFROMGPU {
    #StructPack 8

    hContext : UInt32

    ObjectCount : UInt32

    ObjectHandleArray : IntPtr

    MonitoredFenceValueArray : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'FenceValue', { type: Int64, offset: 16 })
        DefineProp(this.Prototype, 'Reserved', { type: Int64[8], offset: 16 })
        this.DeleteProp("__New")
    }
}
