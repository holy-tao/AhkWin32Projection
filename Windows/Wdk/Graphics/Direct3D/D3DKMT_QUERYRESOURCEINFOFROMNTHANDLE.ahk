#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYRESOURCEINFOFROMNTHANDLE {
    #StructPack 8

    hDevice : UInt32

    hNtHandle : HANDLE

    pPrivateRuntimeData : IntPtr

    PrivateRuntimeDataSize : UInt32

    TotalPrivateDriverDataSize : UInt32

    ResourcePrivateDriverDataSize : UInt32

    NumAllocations : UInt32

}
