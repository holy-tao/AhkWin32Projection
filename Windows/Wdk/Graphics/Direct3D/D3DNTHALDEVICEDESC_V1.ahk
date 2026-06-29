#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHALDEVICEDESC_V1 {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    dcmColorModel : UInt32

    dwDevCaps : UInt32

    dtcTransformCaps : IntPtr

    bClipping : BOOL

    dlcLightingCaps : IntPtr

    dpcLineCaps : IntPtr

    dpcTriCaps : IntPtr

    dwDeviceRenderBitDepth : UInt32

    dwDeviceZBufferBitDepth : UInt32

    dwMaxBufferSize : UInt32

    dwMaxVertexCount : UInt32

}
