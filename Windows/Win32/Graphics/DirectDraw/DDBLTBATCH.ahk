#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IDirectDrawSurface.ahk" { IDirectDrawSurface }
#Import ".\DDBLTFX.ahk" { DDBLTFX }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * The DDBLTBATCH structure passes bit block transfer (bitblt) operations to the IDirectDrawSurface7::BltBatch method.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddbltbatch
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDBLTBATCH {
    #StructPack 8

    /**
     * Address of a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that defines the destination for the bitblt.
     */
    lprDest : RECT.Ptr

    /**
     * Address of a DirectDrawSurface object to be the source of the bitblt.
     */
    lpDDSSrc : IDirectDrawSurface

    /**
     * Address of a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that defines the source rectangle of the bitblt.
     */
    lprSrc : RECT.Ptr

    /**
     * Optional control flags. The following values are defined:
     */
    dwFlags : UInt32

    /**
     * Address of a <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/ns-ddraw-ddbltfx">DDBLTFX</a> structure that specifies additional bitblt effects.
     */
    lpDDBltFx : DDBLTFX.Ptr

}
