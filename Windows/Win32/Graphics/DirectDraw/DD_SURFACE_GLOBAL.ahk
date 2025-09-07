#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDPIXELFORMAT.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * The DD_SURFACE_GLOBAL structure contains global surface-related data that can be shared between multiple surfaces.
 * @remarks
 * A <a href="https://docs.microsoft.com/windows-hardware/drivers/display/direct3d-vertex-buffers">vertex buffer</a>, which is created by <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_createsurface">CreateD3DBuffer</a>, holds a list of vertices used by the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/d3dhal/nc-d3dhal-lpd3dhal_drawprimitives2cb">D3dDrawPrimitives2</a> callback for rendering primitives. Microsoft Windows represents vertex buffers as DirectDraw surfaces, thereby establishing a connection between vertex buffers and the DD_SURFACE_GLOBAL structure.
  * 
  * When a DirectX driver is working with a vertex buffer, it is important for it to be able to correctly determine the size of this buffer. DirectDraw passes the linear buffer size to the driver in the <b>lPitch</b> member of this structure. On Windows 2000 and later versions, but not on Windows 98/Me, the <b>wWidth</b> member of this structure is set to the same value. Note that both structure members should be considered to be read-only. The value that DirectDraw places in these members represents the minimum vertex buffer size. Should the need for a larger buffer arise (such as for optimization), a driver writer is free to create a buffer larger than that size. Under no circumstances, however, should the driver report the larger buffer size to DirectDraw.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_surface_global
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_SURFACE_GLOBAL extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwBlockSizeY {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    lSlicePitch {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<VIDEOMEMORY>}
     */
    lpVidMemHeap {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwBlockSizeX {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwUserMemSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Pointer}
     */
    fpVidMem {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
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
     * Specifies the y-coordinate of the surface. This member is a 2D Cartesian coordinate specified in device space.
     * @type {Integer}
     */
    yHint {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Specifies the x-coordinate of the surface. This member is a 2D Cartesian coordinate specified in device space.
     * @type {Integer}
     */
    xHint {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Specifies the height in pixels of the surface.
     * @type {Integer}
     */
    wHeight {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Specifies the width in pixels of the surface.
     * @type {Integer}
     */
    wWidth {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Reserved for use by the display driver.
     * @type {Pointer}
     */
    dwReserved1 {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Points to the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structure that describes the pixel format of the surface.
     * @type {DDPIXELFORMAT}
     */
    ddpfSurface{
        get {
            if(!this.HasProp("__ddpfSurface"))
                this.__ddpfSurface := DDPIXELFORMAT(this.ptr + 48)
            return this.__ddpfSurface
        }
    }

    /**
     * Points to the raw offset in the source heap.
     * @type {Pointer}
     */
    fpHeapOffset {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {HANDLE}
     */
    hCreatorProcess{
        get {
            if(!this.HasProp("__hCreatorProcess"))
                this.__hCreatorProcess := HANDLE(this.ptr + 88)
            return this.__hCreatorProcess
        }
    }
}
