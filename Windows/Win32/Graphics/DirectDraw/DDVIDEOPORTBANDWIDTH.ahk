#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDVIDEOPORTBANDWIDTH structure describes the bandwidth characteristics of an overlay when used with a particular video port extensions (VPE) object/pixel format configuration.
 * @see https://docs.microsoft.com/windows/win32/api//dvp/ns-dvp-ddvideoportbandwidth
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDVIDEOPORTBANDWIDTH extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Specifies the size in bytes of this DDVIDEOPORTBANDWIDTH structure.
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
    dwCaps {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the stretch factor or overlay source size at which the device can support an overlay, multiplied by 1000. The driver sets this value based on its device's type and capabilities, and on the dimensions specified in the <b>dwWidth</b> and <b>dwHeight</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getvportbandwidthdata">DD_GETVPORTBANDWIDTHDATA</a> structure passed to <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getbandwidth">DdVideoPortGetBandwidth</a>. For example, a stretch factor of 2 is specified as 2000, and an overlay source size of 750 indicates that the specified source overlay be shrunk to 75 percent of its original size. The driver must return a valid number in this member.
     * @type {Integer}
     */
    dwOverlay {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the stretch factor or overlay source size at which an overlay with color keying is supported, multiplied by 1000. The driver sets this value based on its device's type and capabilities, and on the dimensions specified in the <b>dwWidth</b> and <b>dwHeight</b> members of the DD_GETVPORTBANDWIDTHDATA structure passed to <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getbandwidth">DdVideoPortGetBandwidth</a>. For example, a stretch factor of 2 is specified as 2000.
     * @type {Integer}
     */
    dwColorkey {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the stretch factor or overlay source size at which an overlay with y-axis interpolation is supported, multiplied by 1000. The driver sets this value based on its device's type and capabilities, and on the dimensions specified in the <b>dwWidth</b> and <b>dwHeight</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getvportbandwidthdata">DD_GETVPORTBANDWIDTHDATA</a> structure passed to <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getbandwidth">DdVideoPortGetBandwidth</a>. For example, a stretch factor of 2 is specified as 2000.
     * @type {Integer}
     */
    dwYInterpolate {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the stretch factor or overlay source size at which an overlay with y-axis interpolation and color keying is supported, multiplied by 1000. The driver sets this value based on its device's type and capabilities, and on the dimensions specified in the <b>dwWidth</b> and <b>dwHeight</b> members of the DD_GETVPORTBANDWIDTHDATA structure passed to <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getbandwidth">DdVideoPortGetBandwidth</a>. For example, a stretch factor of 2 is specified as 2000.
     * @type {Integer}
     */
    dwYInterpAndColorkey {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Pointer}
     */
    dwReserved1 {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Pointer}
     */
    dwReserved2 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
