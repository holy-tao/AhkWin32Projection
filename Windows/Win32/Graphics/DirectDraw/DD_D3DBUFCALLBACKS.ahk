#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_D3DBUFCALLBACKS structure is used only by drivers that implement driver level allocation of command and vertex buffers.
 * @remarks
 * Drivers that manage their own command and vertex buffers must fill out a DD_D3DBUFCALLBACKS structure and point the <b>lpD3DBufCallbacks</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_halinfo">DD_HALINFO</a> to it. 
  * 
  * The driver must also support the callback functions reported in the DD_D3DBUFCALLBACKS structure. These <i>XxxD3DBuffer</i> callbacks are each analogous to the <i>DdXxxSurface</i> callback of similar name; they have the same prototypes and are called with the same input parameters. These new callbacks are called only when the surface in question has the DDSCAPS_EXECUTEBUFFER flag set in the surface caps. The buffer creation flags are DDSCAPS_WRITEONLY, DDSCAPS2_VERTEXBUFFER and DDSCAPS2_COMMANDBUFFER. 
  * 
  * The driver determines the type of buffer being requested by checking the <b>ddsCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure that is passed to <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_cancreatesurface">CanCreateD3DBuffer</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_createsurface">CreateD3DBuffer</a> for the following flags:
  * 
  * <ul>
  * <li>
  * DDSCAPS_VERTEXBUFFER
  * 
  * Indicates that the driver should allocate an explicit vertex buffer.
  * 
  * </li>
  * <li>
  * DDSCAPS_COMMANDBUFFER
  * 
  * Indicates that the driver should allocate a command buffer. 
  * 
  * </li>
  * <li>
  * The absence of both these flags 
  * 
  * Indicates that the driver should allocate an implicit vertex buffer.
  * 
  * </li>
  * </ul>
  * Implicit vertex buffers should not be placed in video memory because they are expected to be read/write. Only explicit vertex buffers with the DDSCAPS_WRITEONLY flag set can be safely placed in video memory.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_d3dbufcallbacks
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_D3DBUFCALLBACKS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Specifies the size in bytes of this DD_D3DBUFCALLBACKS structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Points to the driver's <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_cancreatesurface">CanCreateD3DBuffer</a> callback.
     * @type {Pointer<Ptr>}
     */
    CanCreateD3DBuffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Points to the driver's <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_createsurface">CreateD3DBuffer</a> callback.
     * @type {Pointer<Ptr>}
     */
    CreateD3DBuffer {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Points to the driver's <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff552754(v=vs.85)">DestroyD3DBuffer</a> callback.
     * @type {Pointer<Ptr>}
     */
    DestroyD3DBuffer {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Points to the driver's <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff568216(v=vs.85)">LockD3DBuffer</a> callback.
     * @type {Pointer<Ptr>}
     */
    LockD3DBuffer {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Points to the driver's <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff570106(v=vs.85)">UnlockD3DBuffer</a> callback.
     * @type {Pointer<Ptr>}
     */
    UnlockD3DBuffer {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
