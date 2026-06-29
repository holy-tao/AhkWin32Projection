#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Graphics\DirectDraw\DDSURFACEDESC.ahk" { DDSURFACEDESC }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_GLOBALDRIVERDATA {
    #StructPack 8

    dwSize : UInt32

    hwCaps : IntPtr

    dwNumVertices : UInt32

    dwNumClipVertices : UInt32

    dwNumTextureFormats : UInt32

    lpTextureFormats : DDSURFACEDESC.Ptr

}
