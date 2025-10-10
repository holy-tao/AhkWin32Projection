#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDVIDEOPORTCAPS structure describes the capabilities and alignment restrictions of a hardware video port.
 * @remarks
 * 
  * The driver reports the capabilities described by the DDVIDEOPORTCAPS structure when its <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> function is called with the GUID_VideoPortCaps GUID.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dvp/ns-dvp-ddvideoportcaps
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDVIDEOPORTCAPS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 4

    /**
     * Specifies the size in bytes of the structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the maximum field width in pixels supported by the hardware video port. This value is typically dictated by the number of bits in the width register.
     * @type {Integer}
     */
    dwMaxWidth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the maximum width, in number of samples, in a line of <a href="https://docs.microsoft.com/windows-hardware/drivers/">VBI</a> data supported by the hardware video port. This value can be larger than the normal field width if the hardware video port supports oversampled VBI data.
     * @type {Integer}
     */
    dwMaxVBIWidth {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the maximum field height in pixels supported by the hardware video port. This value is typically dictated by the number of bits in the height register.
     * @type {Integer}
     */
    dwMaxHeight {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the hardware video port ID for this entry. This member should be the index number of this DDVIDEOPORTCAPS structure within the array to which the <b>lpDDVideoPortCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure points. This value ranges from 0 to (<b>dwMaxVideoPorts</b> - 1). (<b>dwMaxVideoPorts</b> is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawi/ns-ddrawi-ddcorecaps">DDCORECAPS</a> structure.) If the device supports only one hardware video port, this member should be zero.
     * @type {Integer}
     */
    dwVideoPortID {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * 
     * @type {Integer}
     */
    dwCaps {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFX {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Specifies the maximum number of surfaces supported in the autoflip chain, if the hardware video port supports autoflipping. If the hardware video port does not support autoflipping, the driver should set this member to zero.
     * @type {Integer}
     */
    dwNumAutoFlipSurfaces {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Specifies the byte alignment restriction, in bytes, of where the hardware video port can be oriented relative to the origin of the surface in the x direction.
     * @type {Integer}
     */
    dwAlignVideoPortBoundary {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Specifies the byte alignment restriction, in bytes, of how wide the hardware video port data can be when prescaling is performed.
     * @type {Integer}
     */
    dwAlignVideoPortPrescaleWidth {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Specifies the byte alignment restriction, in bytes, for the left cropping coordinate.
     * @type {Integer}
     */
    dwAlignVideoPortCropBoundary {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Specifies the byte alignment restriction, in bytes, for the width of the cropping rectangle.
     * @type {Integer}
     */
    dwAlignVideoPortCropWidth {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Indicates that the hardware video port can shrink the video data width in steps of 1/<b>dwPreshrinkXStep</b>. This member is valid only when the DDVPFX_PRESHRINKXS capability is specified.
     * @type {Integer}
     */
    dwPreshrinkXStep {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Indicates that the hardware video port can shrink the video data height in steps of 1/<b>dwPreshrinkYStep</b>. This member is valid only when the DDVPFX_PRESHRINKYS capability is specified.
     * @type {Integer}
     */
    dwPreshrinkYStep {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Specifies the maximum number of surfaces supported in the autoflip chain, if the hardware video port supports autoflipping. If the hardware video port does not support autoflipping, the driver should set this member to zero. This member works the same way as <b>dwNumAutoFlipSurfaces</b> except that it pertains only to devices that can send the VBI data to a different surface than that to which the normal video is being written.
     * @type {Integer}
     */
    dwNumVBIAutoFlipSurfaces {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Specifies the optimal number of autoflippable surfaces supported by the hardware.
     * @type {Integer}
     */
    dwNumPreferredAutoflip {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Indicates the number of taps the prescaler uses in the x direction. A value of 0 indicates no prescale, a value of 1 indicates replication, and so on.
     * @type {Integer}
     */
    wNumFilterTapsX {
        get => NumGet(this, 68, "ushort")
        set => NumPut("ushort", value, this, 68)
    }

    /**
     * Indicates the number of taps the prescaler uses in the y direction. A value of 0 indicates no prescale, a value of 1 indicates replication, and so on.
     * @type {Integer}
     */
    wNumFilterTapsY {
        get => NumGet(this, 70, "ushort")
        set => NumPut("ushort", value, this, 70)
    }
}
