#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDVIDEOPORTCAPS.ahk" { DDVIDEOPORTCAPS }

/**
 * The DD_DIRECTDRAW_GLOBAL structure contains driver information that describes the driver's device.
 * @remarks
 * DirectDraw allocates memory for this structure. Only one DD_DIRECTDRAW_GLOBAL definition exists per device. In a multimonitor system, each device has its own unique DD_DIRECTDRAW_GLOBAL structure. 
 * 
 * The <b>dwReserved1</b> and <b>dwReserved2</b> members can be used as required by the driver. For example, a driver might store pointers to internal data structures in these members.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_directdraw_global
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_DIRECTDRAW_GLOBAL {
    #StructPack 8

    /**
     * Handle to the driver's private <a href="https://docs.microsoft.com/windows-hardware/drivers/">PDEV</a>.
     */
    dhpdev : IntPtr

    /**
     * Reserved for use by the display driver.
     */
    dwReserved1 : IntPtr

    /**
     * Reserved for use by the display driver.
     */
    dwReserved2 : IntPtr

    /**
     * Points to an array of one or more <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportcaps">DDVIDEOPORTCAPS</a> structures in which the driver should describe the DirectDraw <a href="https://docs.microsoft.com/windows-hardware/drivers/">video port extensions (VPE)</a> objects that it supports. The structures are allocated by DirectDraw; the number of structures is based on the value returned in the <b>dwMaxVideoPort</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/ddrawi/ns-ddrawi-ddcorecaps">DDCORECAPS</a>.
     * 
     * This member is <b>NULL</b> when the driver does not implement the VPE.
     */
    lpDDVideoPortCaps : DDVIDEOPORTCAPS.Ptr

}
