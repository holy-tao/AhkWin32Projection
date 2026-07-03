#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_GETVPORTFIELDDATA.ahk" { DD_GETVPORTFIELDDATA }

/**
 * The DdVideoPortGetField callback function determines whether the current field of an interlaced signal is even or odd.
 * @remarks
 * DirectDraw drivers that set the DDVPCAPS_READBACKFIELD flag in the <b>dwCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportcaps">DDVIDEOPORTCAPS</a> structure must implement <b>DdVideoPortGetField</b>.
 * 
 * The driver should determine whether the current field is even or odd and write <b>TRUE</b> or <b>FALSE</b> in the <b>bField</b> member of the DD_GETVPORTFIELDDATA structure at <b>lpGetField</b>, accordingly. If the query cannot be performed because the hardware video port is disabled, the driver should return DDHAL_DRIVER_HANDLED and set DDERR_VIDEONOTACTIVE in the <b>ddRVal</b> member of DD_GETVPORTFIELDDATA.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_vportcb_getfield
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_VPORTCB_GETFIELD {
    value : IntPtr

    __value {
        set {
            if (value is PDD_VPORTCB_GETFIELD) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_GETVPORTFIELDDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getvportfielddata">DD_GETVPORTFIELDDATA</a> structure that contains the information required for the driver to determine whether the current field is even or odd.
     * @returns {Integer} <b>DdVideoPortGetField</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_GETVPORTFIELDDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_VPORTCB_GETFIELD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_VPORTCB_GETFIELD {
        /**
         * Creates a PDD_VPORTCB_GETFIELD pointer that invokes the given AHK function when called.
         * @param {Func(DD_GETVPORTFIELDDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_GETVPORTFIELDDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
