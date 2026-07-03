#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_GETVPORTBANDWIDTHDATA.ahk" { DD_GETVPORTBANDWIDTHDATA }

/**
 * The DdVideoPortGetBandwidth callback function reports the bandwidth limitations of the device's frame buffer memory based the specified VPE object output format.
 * @remarks
 * <b>DdVideoPortGetBandwidth</b> must be implemented in DirectDraw drivers that support VPE.
 * 
 * <b>DdVideoPortGetBandwidth</b> informs clients of bandwidth requirements for any specified format, helping them to choose a format and better understand its limitations. The driver can supply accurate bandwidth information only after the VPE object has been created because the driver needs the information in the <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportdesc">DDVIDEOPORTDESC</a> structure.
 * 
 * <b>DdVideoPortGetBandwidth</b> is typically called twice to obtain the bandwidth parameters of the specified hardware video port. Depending on the <b>dwFlags</b> member of the DD_GETVPORTBANDWIDTHDATA structure at <i>lpGetVideoPortBandwidth</i>, the driver should do the following:
 * 
 * <ul>
 * <li>
 * When the flag is DDVPB_TYPE, the driver should indicate the type of device it is by setting one of the following flags in the <b>dwCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportbandwidth">DDVIDEOPORTBANDWIDTH</a> structure to which the <b>lpBandwidth</b> member of DD_GETVPORTBANDWIDTHDATA points:<ul>
 * <li>DDVPBCAPS_DESTINATION indicates that the device will describe its bandwidth capabilities in terms of the overlay stretch factor; that is, that the bandwidth information returned by the driver in the next call to <b>DdVideoPortGetBandwidth</b> will refer to the size of the destination overlay. This flag best describes hardware that refreshes from both the primary and overlay surfaces simultaneously. As the destination video is stretched, the hardware has more time to read the pixels from the overlay surface, decreasing the required memory bandwidth.</li>
 * <li>DDVPBCAPS_SOURCE indicates that the device will describe its bandwidth capabilities in terms of the required source overlay size; that is, that the bandwidth information returned by the next call to <b>DdVideoPortGetBandwidth</b> refers to the size of the source overlay. This flag best describes hardware that prefetches the overlay data into a line buffer or large FIFO. Such hardware does not require extra bandwidth, but does require that the source overlay data fit entirely within the buffer/FIFO size supported by the hardware.</li>
 * </ul>
 * 
 * 
 * The driver should also set the <b>dwSize</b> member of the DDVIDEOPORTBANDWIDTH structure before returning.
 * 
 * </li>
 * <li>
 * When the flag is DDVPB_VIDEOPORT, the <b>dwWidth</b> and <b>dwHeight</b> members in the DD_GETVPORTBANDWIDTHDATA structure refer to the prescale size of the video data that the hardware video port will write to the frame buffer as the source overlay. The driver should return an overlay stretch factor at which the device can display the overlay, multiplied by 1000, in each of the <b>dwOverlay</b>, <b>dwColorkey</b>, <b>dwYInterpolate</b>, and <b>dwYInterpAndColorkey</b> members of the DDVIDEOPORTBANDWIDTH structure. For example, a value of 2000 indicates that the device has the bandwidth to stretch the overlay to two times the source's specified size when displaying it. A value of 1000 indicates that no stretching need be done for the specified data size. A value of 500 indicates that the device has sufficient bandwidth to shrink the overlay destination in half. The driver must set a valid value in <b>dwOverlay</b>, but can return -1 in any of the other three members that it does not support.
 * 
 * The DDVPB_VIDEOPORT flag assumes that the device is best described by the DDVPBCAPS_DESTINATION flag. If this is not the case, the driver should fail the call.
 * 
 * </li>
 * <li>
 * When the DDVPB_OVERLAY flag is set, the <b>dwWidth</b> and <b>dwHeight</b> members in the DD_GETVPORTBANDWIDTHDATA structure refer to the source overlay size. The driver should return a percentage of this overlay's size, multiplied by 1000, at which it can support displaying the overlay in each of the <b>dwOverlay</b>, <b>dwColorkey</b>, <b>dwYInterpolate</b>, and <b>dwYInterpAndColorkey</b> members of the DDVIDEOPORTBANDWIDTH structure. For example, a value of 750 indicates that the device requires the specified source overlay to be shrunk to 75% of its original size in order for the device to successfully display it. A value of 1000 indicates that no shrinking is required. Drivers for this type of device do not typically return a value greater than 1000. The driver must set a valid value in <b>dwOverlay</b>, but can return 0 in any of the other three members if it does not support color keying and/or Y-axis interpolation.
 * 
 * The DDVPB_OVERLAY flag assumes that the device is best described using the DDVPBCAPS_SOURCE flag. If this is not the case, the driver should fail the call.
 * 
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_vportcb_getbandwidth
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_VPORTCB_GETBANDWIDTH {
    value : IntPtr

    __value {
        set {
            if (value is PDD_VPORTCB_GETBANDWIDTH) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_GETVPORTBANDWIDTHDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getvportbandwidthdata">DD_GETVPORTBANDWIDTHDATA</a> structure that contains the information required for the driver to return the bandwidth data.
     * @returns {Integer} <b>DdVideoPortGetBandwidth</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_GETVPORTBANDWIDTHDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_VPORTCB_GETBANDWIDTH that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_VPORTCB_GETBANDWIDTH {
        /**
         * Creates a PDD_VPORTCB_GETBANDWIDTH pointer that invokes the given AHK function when called.
         * @param {Func(DD_GETVPORTBANDWIDTHDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_GETVPORTBANDWIDTHDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
