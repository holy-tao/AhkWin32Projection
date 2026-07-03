#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_GETVPORTLINEDATA.ahk" { DD_GETVPORTLINEDATA }

/**
 * The DdVideoPortGetLine callback function returns the current line number of the hardware video port.
 * @remarks
 * Drivers that set the DDVPCAPS_READBACKLINE flag in the <b>dwCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportcaps">DDVIDEOPORTCAPS</a> structure must implement <b>DdVideoPortGetLine</b>.
 * 
 * The driver should write the number of the current video line in the <b>dwLine</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getvportlinedata">DD_GETVPORTLINEDATA</a> structure at <i>lpGetLine</i>. The returned line number must be zero-based; that is, the first line of video is line 0, the second line of video is line 1, etc.
 * 
 * If the device is in a vertical blank, the driver should set DDERR_VERTICALBLANKINPROGRESS in the <b>ddRVal</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getvportlinedata">DD_GETVPORTLINEDATA</a>. If the query cannot be performed because the hardware video port is disabled, the driver should set DDERR_VIDEONOTACTIVE in <b>ddRVal</b>. In both of these failed cases, the driver should return DDHAL_DRIVER_HANDLED.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_vportcb_getline
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_VPORTCB_GETLINE {
    value : IntPtr

    __value {
        set {
            if (value is PDD_VPORTCB_GETLINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_GETVPORTLINEDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getvportlinedata">DD_GETVPORTLINEDATA</a> structure that contains the information required for the driver to determine and return the current line number for the specified hardware video port.
     * @returns {Integer} <b>DdVideoPortGetLine</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_GETVPORTLINEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_VPORTCB_GETLINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_VPORTCB_GETLINE {
        /**
         * Creates a PDD_VPORTCB_GETLINE pointer that invokes the given AHK function when called.
         * @param {Func(DD_GETVPORTLINEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_GETVPORTLINEDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
