#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The DDVIDEOPORTINFO structure describes how the driver should transfer video data to a surface (or to surfaces); DDVIDEOPORTINFO is a member of the DD_VIDEOPORT_LOCAL structure.
 * @remarks
 * 
  * All members of this structure are set by the client and the driver should never change them. The client is typically the overlay mixer.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dvp/ns-dvp-ddvideoportinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDVIDEOPORTINFO extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Specifies the size in bytes of the structure. This member must be initialized before the structure is used.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates the x placement of the video data within the surface, in pixels. This offset applies to all surfaces when autoflipping is requested.
     * @type {Integer}
     */
    dwOriginX {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Indicates the y placement of the video data within the surface, in pixels. This offset applies to all surfaces when autoflipping is requested.
     * @type {Integer}
     */
    dwOriginY {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    dwVPFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies a cropping rectangle in pixels. This member contains a valid rectangle when the DDVP_CROP flag is set in the <b>dwVPFlags</b> member.
     * @type {RECT}
     */
    rCrop{
        get {
            if(!this.HasProp("__rCrop"))
                this.__rCrop := RECT(this.ptr + 16)
            return this.__rCrop
        }
    }

    /**
     * Specifies the width in pixels to which the video and VBI data should be prescaled or zoomed. For example, if the video data is 720 pixels wide and the client requests the width cut in half, the client specifies 360 in <b>dwPrescaleWidth</b>. This member contains a valid width when the DDVP_PRESCALE flag is set in the <b>dwVPFlags</b> member.
     * @type {Integer}
     */
    dwPrescaleWidth {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Specifies the height in pixels to which the video and VBI data should be prescaled or zoomed. For example, if the video data is 240 pixels wide and the client requests the width cut in half, the client specifies 120 in <b>dwPrescaleHeight</b>. This member contains a valid width when the DDVP_PRESCALE flag is set in the <b>dwVPFlags</b> member.
     * @type {Integer}
     */
    dwPrescaleHeight {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structure that specifies the format of the video data to be written to the <a href="https://docs.microsoft.com/windows-hardware/drivers/">video port extensions (VPE)</a> object. This format can be different from the target surface format if the VPE object performs a conversion.
     * @type {Pointer<DDPIXELFORMAT>}
     */
    lpddpfInputFormat {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Points to a DDPIXELFORMAT structure that specifies the input format of the data within the vertical blanking interval.
     * @type {Pointer<DDPIXELFORMAT>}
     */
    lpddpfVBIInputFormat {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Points to a DDPIXELFORMAT structure that specifies the output format of the data within the vertical blanking interval.
     * @type {Pointer<DDPIXELFORMAT>}
     */
    lpddpfVBIOutputFormat {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Specifies the number of lines of data within the vertical blanking interval.
     * @type {Integer}
     */
    dwVBIHeight {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Pointer}
     */
    dwReserved1 {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Pointer}
     */
    dwReserved2 {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
