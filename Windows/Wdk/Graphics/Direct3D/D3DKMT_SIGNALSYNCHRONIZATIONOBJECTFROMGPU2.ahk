#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SIGNALSYNCHRONIZATIONOBJECTFROMGPU2 {
    #StructPack 8

    ObjectCount : UInt32

    ObjectHandleArray : IntPtr

    Flags : IntPtr

    BroadcastContextCount : UInt32

    BroadcastContextArray : IntPtr

    FenceValue : Int64

    static __New() {
        DefineProp(this.Prototype, 'CpuEventHandle', { type: HANDLE, offset: 40 })
        DefineProp(this.Prototype, 'MonitoredFenceValueArray', { type: IntPtr, offset: 40 })
        DefineProp(this.Prototype, 'Reserved', { type: Int64[8], offset: 40 })
        this.DeleteProp("__New")
    }
}
