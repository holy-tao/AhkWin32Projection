#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_WAITFORSYNCHRONIZATIONOBJECTFROMCPU {
    #StructPack 8

    hDevice : UInt32

    ObjectCount : UInt32

    ObjectHandleArray : IntPtr

    FenceValueArray : IntPtr

    hAsyncEvent : HANDLE

    Flags : IntPtr

}
