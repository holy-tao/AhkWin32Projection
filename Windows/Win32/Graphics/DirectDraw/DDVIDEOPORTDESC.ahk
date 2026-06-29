#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDVIDEOPORTCONNECT.ahk" { DDVIDEOPORTCONNECT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DDVIDEOPORTDESC structure describes the video port extensions (VPE) object being created.
 * @see https://learn.microsoft.com/windows/win32/api/dvp/ns-dvp-ddvideoportdesc
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDVIDEOPORTDESC {
    #StructPack 8

    /**
     * Specifies the size in bytes of the DDVIDEOPORTDESC structure.
     */
    dwSize : UInt32

    /**
     * Specifies the width in pixels of the incoming video stream.
     */
    dwFieldWidth : UInt32

    /**
     * Specifies the width, in number of samples, of the <a href="https://docs.microsoft.com/windows-hardware/drivers/">VBI</a> data in the incoming video stream.
     */
    dwVBIWidth : UInt32

    /**
     * Specifies the field height in scan lines of the incoming video stream.
     */
    dwFieldHeight : UInt32

    /**
     * Specifies the time interval in microseconds between live video VSYNCs. This number should be rounded up to the nearest whole microsecond.
     */
    dwMicrosecondsPerField : UInt32

    /**
     * Specifies the maximum pixel rate per second.
     */
    dwMaxPixelsPerSecond : UInt32

    /**
     * Specifies the ID of the hardware video port to be used. This ID should range from 0 to (<b>dwMaxVideoPorts</b> -1), where <b>dwMaxVideoPorts</b> is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawi/ns-ddrawi-ddcorecaps">DDCORECAPS</a> structure.
     */
    dwVideoPortID : UInt32

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    dwReserved1 : UInt32

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddvideoportconnect">DDVIDEOPORTCONNECT</a> structure describing the connection characteristics of the hardware video port.
     */
    VideoPortType : DDVIDEOPORTCONNECT

    /**
     * Reserved for future use and should be ignored by the driver.
     */
    dwReserved2 : IntPtr

    /**
     * Reserved for future use and should be ignored by the driver.
     */
    dwReserved3 : IntPtr

}
