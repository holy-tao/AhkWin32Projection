#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DDVIDEOPORTCAPS structure describes the capabilities and alignment restrictions of a hardware video port.
 * @remarks
 * The driver reports the capabilities described by the DDVIDEOPORTCAPS structure when its <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> function is called with the GUID_VideoPortCaps GUID.
 * @see https://learn.microsoft.com/windows/win32/api/dvp/ns-dvp-ddvideoportcaps
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDVIDEOPORTCAPS {
    #StructPack 4

    /**
     * Specifies the size in bytes of the structure.
     */
    dwSize : UInt32

    dwFlags : UInt32

    /**
     * Specifies the maximum field width in pixels supported by the hardware video port. This value is typically dictated by the number of bits in the width register.
     */
    dwMaxWidth : UInt32

    /**
     * Specifies the maximum width, in number of samples, in a line of <a href="https://docs.microsoft.com/windows-hardware/drivers/">VBI</a> data supported by the hardware video port. This value can be larger than the normal field width if the hardware video port supports oversampled VBI data.
     */
    dwMaxVBIWidth : UInt32

    /**
     * Specifies the maximum field height in pixels supported by the hardware video port. This value is typically dictated by the number of bits in the height register.
     */
    dwMaxHeight : UInt32

    /**
     * Specifies the hardware video port ID for this entry. This member should be the index number of this DDVIDEOPORTCAPS structure within the array to which the <b>lpDDVideoPortCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure points. This value ranges from 0 to (<b>dwMaxVideoPorts</b> - 1). (<b>dwMaxVideoPorts</b> is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawi/ns-ddrawi-ddcorecaps">DDCORECAPS</a> structure.) If the device supports only one hardware video port, this member should be zero.
     */
    dwVideoPortID : UInt32

    dwCaps : UInt32

    dwFX : UInt32

    /**
     * Specifies the maximum number of surfaces supported in the autoflip chain, if the hardware video port supports autoflipping. If the hardware video port does not support autoflipping, the driver should set this member to zero.
     */
    dwNumAutoFlipSurfaces : UInt32

    /**
     * Specifies the byte alignment restriction, in bytes, of where the hardware video port can be oriented relative to the origin of the surface in the x direction.
     */
    dwAlignVideoPortBoundary : UInt32

    /**
     * Specifies the byte alignment restriction, in bytes, of how wide the hardware video port data can be when prescaling is performed.
     */
    dwAlignVideoPortPrescaleWidth : UInt32

    /**
     * Specifies the byte alignment restriction, in bytes, for the left cropping coordinate.
     */
    dwAlignVideoPortCropBoundary : UInt32

    /**
     * Specifies the byte alignment restriction, in bytes, for the width of the cropping rectangle.
     */
    dwAlignVideoPortCropWidth : UInt32

    /**
     * Indicates that the hardware video port can shrink the video data width in steps of 1/<b>dwPreshrinkXStep</b>. This member is valid only when the DDVPFX_PRESHRINKXS capability is specified.
     */
    dwPreshrinkXStep : UInt32

    /**
     * Indicates that the hardware video port can shrink the video data height in steps of 1/<b>dwPreshrinkYStep</b>. This member is valid only when the DDVPFX_PRESHRINKYS capability is specified.
     */
    dwPreshrinkYStep : UInt32

    /**
     * Specifies the maximum number of surfaces supported in the autoflip chain, if the hardware video port supports autoflipping. If the hardware video port does not support autoflipping, the driver should set this member to zero. This member works the same way as <b>dwNumAutoFlipSurfaces</b> except that it pertains only to devices that can send the VBI data to a different surface than that to which the normal video is being written.
     */
    dwNumVBIAutoFlipSurfaces : UInt32

    /**
     * Specifies the optimal number of autoflippable surfaces supported by the hardware.
     */
    dwNumPreferredAutoflip : UInt32

    /**
     * Indicates the number of taps the prescaler uses in the x direction. A value of 0 indicates no prescale, a value of 1 indicates replication, and so on.
     */
    wNumFilterTapsX : UInt16

    /**
     * Indicates the number of taps the prescaler uses in the y direction. A value of 0 indicates no prescale, a value of 1 indicates replication, and so on.
     */
    wNumFilterTapsY : UInt16

}
