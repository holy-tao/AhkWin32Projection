#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OPENKEYEDMUTEXFROMNTHANDLE {
    #StructPack 8

    hNtHandle : HANDLE

    hKeyedMutex : UInt32

    pPrivateRuntimeData : IntPtr

    PrivateRuntimeDataSize : UInt32

}
