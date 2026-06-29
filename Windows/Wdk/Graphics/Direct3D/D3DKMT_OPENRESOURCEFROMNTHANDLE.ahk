#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DDDI_OPENALLOCATIONINFO2.ahk" { D3DDDI_OPENALLOCATIONINFO2 }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OPENRESOURCEFROMNTHANDLE {
    #StructPack 8

    hDevice : UInt32

    hNtHandle : HANDLE

    NumAllocations : UInt32

    pOpenAllocationInfo2 : D3DDDI_OPENALLOCATIONINFO2.Ptr

    PrivateRuntimeDataSize : UInt32

    pPrivateRuntimeData : IntPtr

    ResourcePrivateDriverDataSize : UInt32

    pResourcePrivateDriverData : IntPtr

    TotalPrivateDriverDataBufferSize : UInt32

    pTotalPrivateDriverDataBuffer : IntPtr

    hResource : UInt32

    hKeyedMutex : UInt32

    pKeyedMutexPrivateRuntimeData : IntPtr

    KeyedMutexPrivateRuntimeDataSize : UInt32

    hSyncObject : UInt32

}
