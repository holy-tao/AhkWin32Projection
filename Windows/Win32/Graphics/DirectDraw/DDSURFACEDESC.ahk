#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDCOLORKEY.ahk" { DDCOLORKEY }
#Import ".\DDSCAPS.ahk" { DDSCAPS }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }

/**
 * The DDSURFACEDESC structure contains a description of a surface to be created by the driver.
 * @remarks
 * The relevant members differ for each potential type of surface. This structure is typically created and initialized by an application.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddsurfacedesc
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDSURFACEDESC {
    #StructPack 8

    /**
     * Specifies the size in bytes of this DDSURFACEDESC structure. This member must be initialized before the structure is used.
     */
    dwSize : UInt32

    /**
     * Specifies a set of flags that determine what members of the DDSURFACEDESC structure contain valid data. This member can be one or more of the following flags:
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
     * <td><p>DDSD_HEIGHT</p></td>
     * <td><p>The <strong>dwHeight</strong> member is valid.</p></td>
     * </tr>
     * <tr class="even">
     * <td><p>DDSD_LINEARSIZE</p></td>
     * <td><p>The <strong>dwLinearSize</strong> member is valid.</p></td>
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
     * <td><p>DDSD_WIDTH</p></td>
     * <td><p>The <strong>dwWidth</strong> member is valid.</p></td>
     * </tr>
     * <tr class="even">
     * <td><p>DDSD_ZBUFFERBITDEPTH</p></td>
     * <td><p>The <strong>dwZBufferBitDepth</strong> member is valid.</p></td>
     * </tr>
     * </tbody>
     * </table>
     */
    dwFlags : UInt32

    /**
     * Specifies the height of surface, in pixels.
     */
    dwHeight : UInt32

    /**
     * Specifies the width of the surface, in pixels.
     */
    dwWidth : UInt32

    lPitch : Int32

    /**
     * Specifies the number of back buffers associated with the surface.
     */
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

    /**
     * Specifies the color key for destination overlay use.
     */
    ddckCKDestOverlay : DDCOLORKEY

    /**
     * Specifies the color key for destination blt use.
     */
    ddckCKDestBlt : DDCOLORKEY

    /**
     * Specifies the color key for source overlay use.
     */
    ddckCKSrcOverlay : DDCOLORKEY

    /**
     * Specifies the color key for source blt use.
     */
    ddckCKSrcBlt : DDCOLORKEY

    /**
     * Specifies a [DDPIXELFORMAT](/windows/win32/api/ddraw/ns-ddraw-ddpixelformat) structure that describes the pixel format of the surface.
     */
    ddpfPixelFormat : DDPIXELFORMAT

    /**
     * Specifies a [DDSCAPS](ns-ddraw-ddscaps.md) structure that contains the Microsoft DirectDrawMicrosoft surface capabilities.
     */
    ddsCaps : DDSCAPS

    static __New() {
        DefineProp(this.Prototype, 'dwLinearSize', { type: UInt32, offset: 16 })
        DefineProp(this.Prototype, 'dwZBufferBitDepth', { type: UInt32, offset: 24 })
        DefineProp(this.Prototype, 'dwRefreshRate', { type: UInt32, offset: 24 })
        this.DeleteProp("__New")
    }
}
