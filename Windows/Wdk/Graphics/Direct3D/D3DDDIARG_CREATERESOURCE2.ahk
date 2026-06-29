#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DDDIFORMAT.ahk" { D3DDDIFORMAT }
#Import ".\D3DDDI_POOL.ahk" { D3DDDI_POOL }
#Import ".\D3DDDI_ROTATION.ahk" { D3DDDI_ROTATION }
#Import ".\D3DDDI_SURFACEINFO.ahk" { D3DDDI_SURFACEINFO }
#Import ".\D3DDDIMULTISAMPLE_TYPE.ahk" { D3DDDIMULTISAMPLE_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDIARG_CREATERESOURCE2 {
    #StructPack 8

    Format : D3DDDIFORMAT

    Pool : D3DDDI_POOL

    MultisampleType : D3DDDIMULTISAMPLE_TYPE

    MultisampleQuality : UInt32

    pSurfList : D3DDDI_SURFACEINFO.Ptr

    SurfCount : UInt32

    MipLevels : UInt32

    Fvf : UInt32

    VidPnSourceId : UInt32

    RefreshRate : IntPtr

    hResource : HANDLE

    Flags : IntPtr

    Rotation : D3DDDI_ROTATION

    Flags2 : IntPtr

}
