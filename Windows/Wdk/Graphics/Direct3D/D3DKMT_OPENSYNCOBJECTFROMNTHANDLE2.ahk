#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OPENSYNCOBJECTFROMNTHANDLE2 {
    #StructPack 8


    struct _MonitoredFence {
        FenceValueCPUVirtualAddress : IntPtr

        FenceValueGPUVirtualAddress : Int64

        EngineAffinity : UInt32

    }

    hNtHandle : HANDLE

    hDevice : UInt32

    Flags : IntPtr

    hSyncObject : UInt32

    MonitoredFence : D3DKMT_OPENSYNCOBJECTFROMNTHANDLE2._MonitoredFence

    static __New() {
        DefineProp(this.Prototype, 'Reserved', { type: Int64[8], offset: 32 })
        this.DeleteProp("__New")
    }
}
