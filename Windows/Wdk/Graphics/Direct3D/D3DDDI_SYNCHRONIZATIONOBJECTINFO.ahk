#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_SYNCHRONIZATIONOBJECT_TYPE.ahk" { D3DDDI_SYNCHRONIZATIONOBJECT_TYPE }
#Import "..\..\..\Win32\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_SYNCHRONIZATIONOBJECTINFO {
    #StructPack 4


    struct _SynchronizationMutex {
        InitialState : BOOL

    }

    struct _Semaphore {
        MaxCount : UInt32

        InitialCount : UInt32

    }

    Type : D3DDDI_SYNCHRONIZATIONOBJECT_TYPE

    SynchronizationMutex : D3DDDI_SYNCHRONIZATIONOBJECTINFO._SynchronizationMutex

    static __New() {
        DefineProp(this.Prototype, 'Semaphore', { type: D3DDDI_SYNCHRONIZATIONOBJECTINFO._Semaphore, offset: 4 })
        DefineProp(this.Prototype, 'Reserved', { type: D3DDDI_SYNCHRONIZATIONOBJECTINFO._Reserved, offset: 4 })
        this.DeleteProp("__New")
    }
}
