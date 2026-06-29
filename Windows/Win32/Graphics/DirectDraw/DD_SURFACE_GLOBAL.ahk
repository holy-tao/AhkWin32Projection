#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import ".\VIDEOMEMORY.ahk" { VIDEOMEMORY }

/**
 * The DD_SURFACE_GLOBAL structure contains global surface-related data that can be shared between multiple surfaces.
 * @remarks
 * A <a href="https://docs.microsoft.com/windows-hardware/drivers/display/direct3d-vertex-buffers">vertex buffer</a>, which is created by <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_createsurface">CreateD3DBuffer</a>, holds a list of vertices used by the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/d3dhal/nc-d3dhal-lpd3dhal_drawprimitives2cb">D3dDrawPrimitives2</a> callback for rendering primitives. Microsoft Windows represents vertex buffers as DirectDraw surfaces, thereby establishing a connection between vertex buffers and the DD_SURFACE_GLOBAL structure.
 * 
 * When a DirectX driver is working with a vertex buffer, it is important for it to be able to correctly determine the size of this buffer. DirectDraw passes the linear buffer size to the driver in the <b>lPitch</b> member of this structure. On Windows 2000 and later versions, but not on Windows 98/Me, the <b>wWidth</b> member of this structure is set to the same value. Note that both structure members should be considered to be read-only. The value that DirectDraw places in these members represents the minimum vertex buffer size. Should the need for a larger buffer arise (such as for optimization), a driver writer is free to create a buffer larger than that size. Under no circumstances, however, should the driver report the larger buffer size to DirectDraw.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_surface_global
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_SURFACE_GLOBAL {
    #StructPack 8

    dwBlockSizeY : UInt32

    lpVidMemHeap : VIDEOMEMORY.Ptr

    fpVidMem : IntPtr

    lPitch : Int32

    /**
     * Specifies the y-coordinate of the surface. This member is a 2D Cartesian coordinate specified in device space.
     */
    yHint : Int32

    /**
     * Specifies the x-coordinate of the surface. This member is a 2D Cartesian coordinate specified in device space.
     */
    xHint : Int32

    /**
     * Specifies the height in pixels of the surface.
     */
    wHeight : UInt32

    /**
     * Specifies the width in pixels of the surface.
     */
    wWidth : UInt32

    /**
     * Reserved for use by the display driver.
     */
    dwReserved1 : IntPtr

    /**
     * Points to the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structure that describes the pixel format of the surface.
     */
    ddpfSurface : DDPIXELFORMAT

    /**
     * Points to the raw offset in the source heap.
     */
    fpHeapOffset : IntPtr

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    hCreatorProcess : HANDLE

    static __New() {
        DefineProp(this.Prototype, 'lSlicePitch', { type: Int32, offset: 0 })
        DefineProp(this.Prototype, 'dwBlockSizeX', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'dwUserMemSize', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'dwLinearSize', { type: UInt32, offset: 24 })
        this.DeleteProp("__New")
    }
}
