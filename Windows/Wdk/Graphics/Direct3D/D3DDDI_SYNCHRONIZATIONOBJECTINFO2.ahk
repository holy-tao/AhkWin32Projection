#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3DDDI_SYNCHRONIZATIONOBJECT_TYPE.ahk" { D3DDDI_SYNCHRONIZATIONOBJECT_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_SYNCHRONIZATIONOBJECTINFO2 {
    #StructPack 8


    struct _SynchronizationMutex {
        InitialState : BOOL

    }

    struct _Semaphore {
        MaxCount : UInt32

        InitialCount : UInt32

    }

    struct _Fence {
        FenceValue : Int64

    }

    struct _CPUNotification {
        Event : HANDLE

    }

    struct _MonitoredFence {
        InitialFenceValue : Int64

        FenceValueCPUVirtualAddress : IntPtr

        FenceValueGPUVirtualAddress : Int64

        EngineAffinity : UInt32

        Padding : UInt32

    }

    struct _PeriodicMonitoredFence {
        hAdapter : UInt32

        VidPnTargetId : UInt32

        Time : Int64

        FenceValueCPUVirtualAddress : IntPtr

        FenceValueGPUVirtualAddress : Int64

        EngineAffinity : UInt32

        Padding : UInt32

    }

    Type : D3DDDI_SYNCHRONIZATIONOBJECT_TYPE

    Flags : IntPtr

    SynchronizationMutex : D3DDDI_SYNCHRONIZATIONOBJECTINFO2._SynchronizationMutex

    SharedHandle : UInt32

    static __New() {
        DefineProp(this.Prototype, 'Semaphore', { type: D3DDDI_SYNCHRONIZATIONOBJECTINFO2._Semaphore, offset: 16 })
        DefineProp(this.Prototype, 'Fence', { type: D3DDDI_SYNCHRONIZATIONOBJECTINFO2._Fence, offset: 16 })
        DefineProp(this.Prototype, 'CPUNotification', { type: D3DDDI_SYNCHRONIZATIONOBJECTINFO2._CPUNotification, offset: 16 })
        DefineProp(this.Prototype, 'MonitoredFence', { type: D3DDDI_SYNCHRONIZATIONOBJECTINFO2._MonitoredFence, offset: 16 })
        DefineProp(this.Prototype, 'PeriodicMonitoredFence', { type: D3DDDI_SYNCHRONIZATIONOBJECTINFO2._PeriodicMonitoredFence, offset: 16 })
        DefineProp(this.Prototype, 'Reserved', { type: D3DDDI_SYNCHRONIZATIONOBJECTINFO2._Reserved, offset: 16 })
        this.DeleteProp("__New")
    }
}
