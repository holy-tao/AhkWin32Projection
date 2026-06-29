#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }

/**
 * The VIDEOMEMORYINFO structure describes the general format of the display's memory.
 * @remarks
 * The VIDEOMEMORYINFO structure has minor differences between Windows 98/Me and Windows 2000 and later. On Windows 2000 and later the data structure is called VIDEOMEMORYINFO and on Windows 98/Me the data structure is called VIDMEMINFO. On Windows 2000 and later, VIDEOMEMORYINFO includes a field <b>pvPrimary</b> that stores a kernel-mode pointer to the primary surface. On Windows 98/Me, VIDMEMINFO includes the fields <b>dwNumHeaps</b> and <b>pvmList</b> that specify an array of memory heaps.
 * 
 * GDI allocates memory for and passes a VIDEOMEMORYINFO structure to the driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvgetdirectdrawinfo">DrvGetDirectDrawInfo</a> function as a member of the DD_HALINFO parameter. The driver should fill in the appropriate members to describe the general characteristics of the device's memory.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-videomemoryinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct VIDEOMEMORYINFO {
    #StructPack 8

    /**
     * Specifies the offset, in bytes, in display memory to the primary surface.
     */
    fpPrimary : IntPtr

    /**
     * Currently unused and should be set to zero.
     */
    dwFlags : UInt32

    /**
     * Specifies the current width of the display, in pixels.
     */
    dwDisplayWidth : UInt32

    /**
     * Specifies the current height of the display, in pixels.
     */
    dwDisplayHeight : UInt32

    /**
     * Specifies the current pitch of the display, in bytes.
     */
    lDisplayPitch : Int32

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structure in which the pixel format of the display is described.
     */
    ddpfDisplay : DDPIXELFORMAT

    /**
     * Specifies the byte alignment, in bytes, required when allocating this memory for offscreen surfaces.
     */
    dwOffscreenAlign : UInt32

    /**
     * Specifies the byte alignment, in bytes, required when allocating this memory for overlay planes.
     */
    dwOverlayAlign : UInt32

    /**
     * Specifies the byte alignment, in bytes, required when allocating this memory for textures.
     */
    dwTextureAlign : UInt32

    /**
     * Specifies the byte alignment, in bytes, required when allocating this memory for the depth buffer.
     */
    dwZBufferAlign : UInt32

    /**
     * Specifies the byte alignment, in bytes, required when allocating this memory for an alpha buffer.
     */
    dwAlphaAlign : UInt32

    /**
     * (Microsoft Windows 2000 and later only) 
     * 
     * Specifies a kernel-mode pointer to the beginning of the primary surface.
     */
    pvPrimary : IntPtr

}
