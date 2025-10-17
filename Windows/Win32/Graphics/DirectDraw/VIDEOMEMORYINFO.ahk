#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDPIXELFORMAT.ahk

/**
 * The VIDEOMEMORYINFO structure describes the general format of the display's memory.
 * @remarks
 * 
  * The VIDEOMEMORYINFO structure has minor differences between Windows 98/Me and Windows 2000 and later. On Windows 2000 and later the data structure is called VIDEOMEMORYINFO and on Windows 98/Me the data structure is called VIDMEMINFO. On Windows 2000 and later, VIDEOMEMORYINFO includes a field <b>pvPrimary</b> that stores a kernel-mode pointer to the primary surface. On Windows 98/Me, VIDMEMINFO includes the fields <b>dwNumHeaps</b> and <b>pvmList</b> that specify an array of memory heaps.
  * 
  * GDI allocates memory for and passes a VIDEOMEMORYINFO structure to the driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvgetdirectdrawinfo">DrvGetDirectDrawInfo</a> function as a member of the DD_HALINFO parameter. The driver should fill in the appropriate members to describe the general characteristics of the device's memory.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ddrawint/ns-ddrawint-videomemoryinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class VIDEOMEMORYINFO extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Specifies the offset, in bytes, in display memory to the primary surface.
     * @type {Pointer}
     */
    fpPrimary {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Currently unused and should be set to zero.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the current width of the display, in pixels.
     * @type {Integer}
     */
    dwDisplayWidth {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the current height of the display, in pixels.
     * @type {Integer}
     */
    dwDisplayHeight {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the current pitch of the display, in bytes.
     * @type {Integer}
     */
    lDisplayPitch {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structure in which the pixel format of the display is described.
     * @type {DDPIXELFORMAT}
     */
    ddpfDisplay{
        get {
            if(!this.HasProp("__ddpfDisplay"))
                this.__ddpfDisplay := DDPIXELFORMAT(24, this)
            return this.__ddpfDisplay
        }
    }

    /**
     * Specifies the byte alignment, in bytes, required when allocating this memory for offscreen surfaces.
     * @type {Integer}
     */
    dwOffscreenAlign {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Specifies the byte alignment, in bytes, required when allocating this memory for overlay planes.
     * @type {Integer}
     */
    dwOverlayAlign {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Specifies the byte alignment, in bytes, required when allocating this memory for textures.
     * @type {Integer}
     */
    dwTextureAlign {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Specifies the byte alignment, in bytes, required when allocating this memory for the depth buffer.
     * @type {Integer}
     */
    dwZBufferAlign {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Specifies the byte alignment, in bytes, required when allocating this memory for an alpha buffer.
     * @type {Integer}
     */
    dwAlphaAlign {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * (Microsoft Windows 2000 and later only) 
     * 
     * Specifies a kernel-mode pointer to the beginning of the primary surface.
     * @type {Pointer<Void>}
     */
    pvPrimary {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
