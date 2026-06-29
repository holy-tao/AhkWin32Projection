#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * The DDVIDEOPORTINFO structure describes how the driver should transfer video data to a surface (or to surfaces); DDVIDEOPORTINFO is a member of the DD_VIDEOPORT_LOCAL structure.
 * @remarks
 * All members of this structure are set by the client and the driver should never change them. The client is typically the overlay mixer.
 * @see https://learn.microsoft.com/windows/win32/api/dvp/ns-dvp-ddvideoportinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDVIDEOPORTINFO {
    #StructPack 8

    /**
     * Specifies the size in bytes of the structure. This member must be initialized before the structure is used.
     */
    dwSize : UInt32

    /**
     * Indicates the x placement of the video data within the surface, in pixels. This offset applies to all surfaces when autoflipping is requested.
     */
    dwOriginX : UInt32

    /**
     * Indicates the y placement of the video data within the surface, in pixels. This offset applies to all surfaces when autoflipping is requested.
     */
    dwOriginY : UInt32

    dwVPFlags : UInt32

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies a cropping rectangle in pixels. This member contains a valid rectangle when the DDVP_CROP flag is set in the <b>dwVPFlags</b> member.
     */
    rCrop : RECT

    /**
     * Specifies the width in pixels to which the video and VBI data should be prescaled or zoomed. For example, if the video data is 720 pixels wide and the client requests the width cut in half, the client specifies 360 in <b>dwPrescaleWidth</b>. This member contains a valid width when the DDVP_PRESCALE flag is set in the <b>dwVPFlags</b> member.
     */
    dwPrescaleWidth : UInt32

    /**
     * Specifies the height in pixels to which the video and VBI data should be prescaled or zoomed. For example, if the video data is 240 pixels wide and the client requests the width cut in half, the client specifies 120 in <b>dwPrescaleHeight</b>. This member contains a valid width when the DDVP_PRESCALE flag is set in the <b>dwVPFlags</b> member.
     */
    dwPrescaleHeight : UInt32

    /**
     * Points to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structure that specifies the format of the video data to be written to the <a href="https://docs.microsoft.com/windows-hardware/drivers/">video port extensions (VPE)</a> object. This format can be different from the target surface format if the VPE object performs a conversion.
     */
    lpddpfInputFormat : DDPIXELFORMAT.Ptr

    /**
     * Points to a DDPIXELFORMAT structure that specifies the input format of the data within the vertical blanking interval.
     */
    lpddpfVBIInputFormat : DDPIXELFORMAT.Ptr

    /**
     * Points to a DDPIXELFORMAT structure that specifies the output format of the data within the vertical blanking interval.
     */
    lpddpfVBIOutputFormat : DDPIXELFORMAT.Ptr

    /**
     * Specifies the number of lines of data within the vertical blanking interval.
     */
    dwVBIHeight : UInt32

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    dwReserved1 : IntPtr

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    dwReserved2 : IntPtr

}
