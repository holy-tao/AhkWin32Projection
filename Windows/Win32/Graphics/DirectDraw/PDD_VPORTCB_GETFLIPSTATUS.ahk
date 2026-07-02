#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_GETVPORTFLIPSTATUSDATA.ahk" { DD_GETVPORTFLIPSTATUSDATA }

/**
 * The DdVideoPortGetFlipStatus callback function determines whether the most recently requested flip on a surface has occurred.
 * @remarks
 * DirectDraw drivers that support VPE must implement <i>DdVideoPortGetFlipStatus</i>.
 * 
 * The driver should set the <b>ddRVal</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getvportflipstatusdata">DD_GETVPORTFLIPSTATUSDATA</a> structure at <i>lpGetFlipStatus</i> to DDERR_WASSTILLDRAWING and return DDHAL_DRIVER_HANDLED if a flip is currently in progress; otherwise the driver should set <b>ddRVal</b> to DD_OK and return DDHAL_DRIVER_HANDLED.
 * 
 * If the driver sets <b>ddRVal</b> to DDERR_WASSTILLDRAWING, DirectDraw will fail locks and blits on that surface.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_vportcb_getflipstatus
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_VPORTCB_GETFLIPSTATUS {
    value : IntPtr

    __value {
        set {
            if (value is PDD_VPORTCB_GETFLIPSTATUS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_GETVPORTFLIPSTATUSDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getvportflipstatusdata">DD_GETVPORTFLIPSTATUSDATA</a> structure that contains the information required for the driver to determine a surface's flip status.
     * @returns {Integer} <i>DdVideoPortGetFlipStatus</i> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_GETVPORTFLIPSTATUSDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_VPORTCB_GETFLIPSTATUS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_VPORTCB_GETFLIPSTATUS {
        /**
         * Creates a PDD_VPORTCB_GETFLIPSTATUS pointer that invokes the given AHK function when called.
         * @param {Func(DD_GETVPORTFLIPSTATUSDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_GETVPORTFLIPSTATUSDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
