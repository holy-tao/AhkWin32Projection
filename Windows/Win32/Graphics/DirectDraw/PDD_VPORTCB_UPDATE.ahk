#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_UPDATEVPORTDATA.ahk" { DD_UPDATEVPORTDATA }

/**
 * The DdVideoPortUpdate callback function starts and stops the VPE object, and modifies the VPE object data stream.
 * @remarks
 * DirectDraw drivers that support VPE must implement <b>DdVideoPortUpdate</b>.
 * 
 * When the <b>dwFlags</b> member of the DD_UPDATEVPORTDATA structure at <i>lpUpdate</i> is DDRAWI_VPORTSTART or DDRAWI_VPORTUPDATE, the driver should do the following:
 * 
 * <ul>
 * <li>
 * Check all flags in the <b>dwVPFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportinfo">DDVIDEOPORTINFO</a> structure to which the <i>lpVideoInfo</i> member of DD_UPDATEVPORTDATA points. These flags describe how the driver should transfer video data to a surface (or surfaces); for example, they indicate whether the driver should perform autoflipping, crop the video or <a href="https://docs.microsoft.com/windows-hardware/drivers/">VBI</a> data, etc.
 * 
 * </li>
 * <li>
 * Set up loops in the hardware to write video and/or VBI data to the surfaces in the order in which the surfaces are stored in the array(s). The driver should return as quickly as possible after setting up these loops.
 * 
 * </li>
 * <li>
 * If autoflipping has been requested, store the frame buffer offset for each surface in the driver's internal data structure. The surface offsets should be stored in the order in which the surfaces occur in the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_int">DD_SURFACE_INT</a> arrays at the <b>lplpDDSurface</b> and <b>lplpDDVBISurface</b> members of DD_UPDATEVPORTDATA. In this way, when <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_updateoverlay">DdUpdateOverlay</a> is called, the driver has a record of the flipping order of the surface chain.
 * 
 * </li>
 * </ul>
 * If the <b>dwVBIHeight</b> member of the DDVIDEOPORTINFO structure is greater than zero and <b>lplpDDVBISurface</b> is not <b>NULL</b>, the driver should write the lines of <a href="https://docs.microsoft.com/windows-hardware/drivers/">VBI</a> data specified by the number in <b>dwVBIHeight</b> into each surface in the array to which <b>lplpDDVBISurface</b> points.
 * 
 * If the driver's hardware cannot support the number of surfaces specified when autoflipping is requested, <b>DdVideoPortUpdate</b> should fail the call by setting DDERR_UNSUPPORTED in the <b>ddRVal</b> member of DD_UPDATEVPORTDATA.
 * 
 * The number of surfaces in the video and <a href="https://docs.microsoft.com/windows-hardware/drivers/">VBI</a> surface chains can be different; that is, the <b>dwNumAutoflip</b> and <b>dwNumVBIAutoflip</b> members of DD_UPDATEVPORTDATA can be different values.
 * 
 * When <b>dwFlags</b> is DDRAWI_VPORTSTOP, the driver should return immediately. The driver should not poll until the data stream stops.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_vportcb_update
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_VPORTCB_UPDATE {
    value : IntPtr

    __value {
        set {
            if (value is PDD_VPORTCB_UPDATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_UPDATEVPORTDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_updatevportdata">DD_UPDATEVPORTDATA</a> structure that contains the information required for the driver to update the VPE object.
     * @returns {Integer} <b>DdVideoPortUpdate</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_UPDATEVPORTDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_VPORTCB_UPDATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_VPORTCB_UPDATE {
        /**
         * Creates a PDD_VPORTCB_UPDATE pointer that invokes the given AHK function when called.
         * @param {Func(DD_UPDATEVPORTDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_UPDATEVPORTDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
