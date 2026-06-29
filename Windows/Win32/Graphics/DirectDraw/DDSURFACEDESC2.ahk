#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDSCAPS2.ahk" { DDSCAPS2 }
#Import ".\DDCOLORKEY.ahk" { DDCOLORKEY }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }

/**
 * The DDSURFACEDESC2 structure contains a description of a surface to be created by the driver.
 * @remarks
 * The relevant members differ for each potential type of surface. This structure is typically created and initialized by an application.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddsurfacedesc2
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDSURFACEDESC2 {
    #StructPack 8

    /**
     * Specifies the size in bytes of this DDSURFACEDESC2 structure. This member must be initialized before the structure is used.
     */
    dwSize : UInt32

    /**
     * Specifies a set of flags that determine what members of the DDSURFACEDESC2 structure contain valid data. This member can be one or more of the following flags:
     * 
     * <table>
     * <colgroup>
     * <col style="width: 50%" />
     * <col style="width: 50%" />
     * </colgroup>
     * <thead>
     * <tr class="header">
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * </thead>
     * <tbody>
     * <tr class="odd">
     * <td><p>DDSD_ALL</p></td>
     * <td><p>All input members contain valid data.</p></td>
     * </tr>
     * <tr class="even">
     * <td><p>DDSD_ALPHABITDEPTH</p></td>
     * <td><p>The <strong>dwAlphaBitDepth</strong> member is valid.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><p>DDSD_BACKBUFFERCOUNT</p></td>
     * <td><p>The <strong>dwBackBufferCount</strong> member is valid.</p></td>
     * </tr>
     * <tr class="even">
     * <td><p>DDSD_CAPS</p></td>
     * <td><p>The <strong>ddsCaps</strong> member is valid.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><p>DDSD_CKDESTBLT</p></td>
     * <td><p>The <strong>ddckCKDestBlt</strong> member is valid.</p></td>
     * </tr>
     * <tr class="even">
     * <td><p>DDSD_CKDESTOVERLAY</p></td>
     * <td><p>The <strong>ddckCKDestOverlay</strong> member is valid.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><p>DDSD_CKSRCBLT</p></td>
     * <td><p>The <strong>ddckCKSrcBlt</strong> member is valid.</p></td>
     * </tr>
     * <tr class="even">
     * <td><p>DDSD_CKSRCOVERLAY</p></td>
     * <td><p>The <strong>ddckCKSrcOverlay</strong> member is valid.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><p>DDSD_FVF</p></td>
     * <td><p>The <strong>dwFVF</strong> member is valid.</p></td>
     * </tr>
     * <tr class="even">
     * <td><p>DDSD_HEIGHT</p></td>
     * <td><p>The <strong>dwHeight</strong> member is valid.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><p>DDSD_LINEARSIZE</p></td>
     * <td><p>The <strong>dwLinearSize</strong> member is valid.</p></td>
     * </tr>
     * <tr class="even">
     * <td><p>DDSD_LPSURFACE</p></td>
     * <td><p>The <strong>lpSurface</strong> member is valid.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><p>DDSD_MIPMAPCOUNT</p></td>
     * <td><p>The <strong>dwMipMapCount</strong> member is valid.</p></td>
     * </tr>
     * <tr class="even">
     * <td><p>DDSD_PITCH</p></td>
     * <td><p>The <strong>lPitch</strong> member is valid.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><p>DDSD_PIXELFORMAT</p></td>
     * <td><p>The <strong>ddpfPixelFormat</strong> member is valid.</p></td>
     * </tr>
     * <tr class="even">
     * <td><p>DDSD_REFRESHRATE</p></td>
     * <td><p>The <strong>dwRefreshRate</strong> member is valid.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><p>DDSD_SRCVBHANDLE</p></td>
     * <td><p>The <strong>dwSrcVBHandle</strong> member is valid.</p></td>
     * </tr>
     * <tr class="even">
     * <td><p>DDSD_TEXTURESTAGE</p></td>
     * <td><p>The <strong>dwTextureStage</strong> member is valid.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><p>DDSD_WIDTH</p></td>
     * <td><p>The <strong>dwWidth</strong> member is valid.</p></td>
     * </tr>
     * <tr class="even">
     * <td><p>DDSD_ZBUFFERBITDEPTH</p></td>
     * <td><p>This flag is not used in DDSURFACEDESC2. It is only used in <a href="ns-ddraw-ddsurfacedesc.md"><strong>DDSURFACEDESC</strong></a>.</p></td>
     * </tr>
     * </tbody>
     * </table>
     */
    dwFlags : UInt32

    /**
     * Specifies the height of surface in pixels.
     */
    dwHeight : UInt32

    /**
     * Specifies the width of the surface in pixels.
     */
    dwWidth : UInt32

    lPitch : Int32

    dwBackBufferCount : UInt32

    dwMipMapCount : UInt32

    /**
     * Specifies the depth of the alpha buffer in bits per pixel.
     */
    dwAlphaBitDepth : UInt32

    /**
     * Reserved, and should be set to zero.
     */
    dwReserved : UInt32

    /**
     * Specifies the address of the associated surface memory.
     */
    lpSurface : IntPtr

    ddckCKDestOverlay : DDCOLORKEY

    /**
     * Specifies the color key for destination blit use.
     */
    ddckCKDestBlt : DDCOLORKEY

    /**
     * Specifies the color key for source overlay use.
     */
    ddckCKSrcOverlay : DDCOLORKEY

    /**
     * Specifies the color key for source blit use.
     */
    ddckCKSrcBlt : DDCOLORKEY

    ddpfPixelFormat : DDPIXELFORMAT

    /**
     * Specifies a [DDSCAPS](ns-ddraw-ddscaps.md) structure that contains the DirectDraw surface capabilities.
     */
    ddsCaps : DDSCAPS2

    /**
     * Specifies the stage in the multitexture cascade. For more information, see [Texture Stages](/windows-hardware/drivers/display/texture-stages).
     */
    dwTextureStage : UInt32

    static __New() {
        DefineProp(this.Prototype, 'dwLinearSize', { type: UInt32, offset: 16 })
        DefineProp(this.Prototype, 'dwDepth', { type: UInt32, offset: 20 })
        DefineProp(this.Prototype, 'dwRefreshRate', { type: UInt32, offset: 24 })
        DefineProp(this.Prototype, 'dwSrcVBHandle', { type: UInt32, offset: 24 })
        DefineProp(this.Prototype, 'dwEmptyFaceColor', { type: UInt32, offset: 48 })
        DefineProp(this.Prototype, 'dwFVF', { type: UInt32, offset: 80 })
        this.DeleteProp("__New")
    }
}
