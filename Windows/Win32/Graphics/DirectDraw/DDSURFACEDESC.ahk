#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDCOLORKEY.ahk
#Include .\DDPIXELFORMAT.ahk
#Include .\DDSCAPS.ahk

/**
 * The DDSURFACEDESC structure contains a description of a surface to be created by the driver.
 * @remarks
 * The relevant members differ for each potential type of surface. This structure is typically created and initialized by an application.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddsurfacedesc
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDSURFACEDESC extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * Specifies the size in bytes of this DDSURFACEDESC structure. This member must be initialized before the structure is used.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the height of surface, in pixels.
     * @type {Integer}
     */
    dwHeight {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the width of the surface, in pixels.
     * @type {Integer}
     */
    dwWidth {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    lPitch {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwLinearSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the number of back buffers associated with the surface.
     * @type {Integer}
     */
    dwBackBufferCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwMipMapCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwZBufferBitDepth {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwRefreshRate {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the depth of the alpha buffer in bits per pixel.
     * @type {Integer}
     */
    dwAlphaBitDepth {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Reserved, and should be set to zero.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Specifies the address of the associated surface memory.
     * @type {Pointer<Void>}
     */
    lpSurface {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Specifies the color key for destination overlay use.
     * @type {DDCOLORKEY}
     */
    ddckCKDestOverlay{
        get {
            if(!this.HasProp("__ddckCKDestOverlay"))
                this.__ddckCKDestOverlay := DDCOLORKEY(48, this)
            return this.__ddckCKDestOverlay
        }
    }

    /**
     * Specifies the color key for destination blt use.
     * @type {DDCOLORKEY}
     */
    ddckCKDestBlt{
        get {
            if(!this.HasProp("__ddckCKDestBlt"))
                this.__ddckCKDestBlt := DDCOLORKEY(56, this)
            return this.__ddckCKDestBlt
        }
    }

    /**
     * Specifies the color key for source overlay use.
     * @type {DDCOLORKEY}
     */
    ddckCKSrcOverlay{
        get {
            if(!this.HasProp("__ddckCKSrcOverlay"))
                this.__ddckCKSrcOverlay := DDCOLORKEY(64, this)
            return this.__ddckCKSrcOverlay
        }
    }

    /**
     * Specifies the color key for source blt use.
     * @type {DDCOLORKEY}
     */
    ddckCKSrcBlt{
        get {
            if(!this.HasProp("__ddckCKSrcBlt"))
                this.__ddckCKSrcBlt := DDCOLORKEY(72, this)
            return this.__ddckCKSrcBlt
        }
    }

    /**
     * Specifies a [DDPIXELFORMAT](/windows/win32/api/ddraw/ns-ddraw-ddpixelformat) structure that describes the pixel format of the surface.
     * @type {DDPIXELFORMAT}
     */
    ddpfPixelFormat{
        get {
            if(!this.HasProp("__ddpfPixelFormat"))
                this.__ddpfPixelFormat := DDPIXELFORMAT(80, this)
            return this.__ddpfPixelFormat
        }
    }

    /**
     * Specifies a [DDSCAPS](ns-ddraw-ddscaps.md) structure that contains the Microsoft DirectDrawMicrosoft surface capabilities.
     * @type {DDSCAPS}
     */
    ddsCaps{
        get {
            if(!this.HasProp("__ddsCaps"))
                this.__ddsCaps := DDSCAPS(112, this)
            return this.__ddsCaps
        }
    }
}
