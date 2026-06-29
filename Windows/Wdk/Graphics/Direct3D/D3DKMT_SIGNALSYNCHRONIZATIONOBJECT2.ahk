#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SIGNALSYNCHRONIZATIONOBJECT2 {
    #StructPack 8


    struct _Fence {
        FenceValue : Int64

    }

    hContext : UInt32

    ObjectCount : UInt32

    ObjectHandleArray : UInt32[32]

    Flags : IntPtr

    BroadcastContextCount : UInt32

    BroadcastContext : UInt32[64]

    Fence : D3DKMT_SIGNALSYNCHRONIZATIONOBJECT2._Fence

    static __New() {
        DefineProp(this.Prototype, 'CpuEventHandle', { type: HANDLE, offset: 408 })
        DefineProp(this.Prototype, 'Reserved', { type: Int64[8], offset: 408 })
        this.DeleteProp("__New")
    }
}
