#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DDVIDEOPORTBANDWIDTH structure describes the bandwidth characteristics of an overlay when used with a particular video port extensions (VPE) object/pixel format configuration.
 * @see https://learn.microsoft.com/windows/win32/api/dvp/ns-dvp-ddvideoportbandwidth
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDVIDEOPORTBANDWIDTH {
    #StructPack 8

    /**
     * Specifies the size in bytes of this DDVIDEOPORTBANDWIDTH structure.
     */
    dwSize : UInt32

    dwCaps : UInt32

    /**
     * Specifies the stretch factor or overlay source size at which the device can support an overlay, multiplied by 1000. The driver sets this value based on its device's type and capabilities, and on the dimensions specified in the <b>dwWidth</b> and <b>dwHeight</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getvportbandwidthdata">DD_GETVPORTBANDWIDTHDATA</a> structure passed to <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getbandwidth">DdVideoPortGetBandwidth</a>. For example, a stretch factor of 2 is specified as 2000, and an overlay source size of 750 indicates that the specified source overlay be shrunk to 75 percent of its original size. The driver must return a valid number in this member.
     */
    dwOverlay : UInt32

    /**
     * Specifies the stretch factor or overlay source size at which an overlay with color keying is supported, multiplied by 1000. The driver sets this value based on its device's type and capabilities, and on the dimensions specified in the <b>dwWidth</b> and <b>dwHeight</b> members of the DD_GETVPORTBANDWIDTHDATA structure passed to <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getbandwidth">DdVideoPortGetBandwidth</a>. For example, a stretch factor of 2 is specified as 2000.
     */
    dwColorkey : UInt32

    /**
     * Specifies the stretch factor or overlay source size at which an overlay with y-axis interpolation is supported, multiplied by 1000. The driver sets this value based on its device's type and capabilities, and on the dimensions specified in the <b>dwWidth</b> and <b>dwHeight</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getvportbandwidthdata">DD_GETVPORTBANDWIDTHDATA</a> structure passed to <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getbandwidth">DdVideoPortGetBandwidth</a>. For example, a stretch factor of 2 is specified as 2000.
     */
    dwYInterpolate : UInt32

    /**
     * Specifies the stretch factor or overlay source size at which an overlay with y-axis interpolation and color keying is supported, multiplied by 1000. The driver sets this value based on its device's type and capabilities, and on the dimensions specified in the <b>dwWidth</b> and <b>dwHeight</b> members of the DD_GETVPORTBANDWIDTHDATA structure passed to <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getbandwidth">DdVideoPortGetBandwidth</a>. For example, a stretch factor of 2 is specified as 2000.
     */
    dwYInterpAndColorkey : UInt32

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    dwReserved1 : IntPtr

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    dwReserved2 : IntPtr

}
