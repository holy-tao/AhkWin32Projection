#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_WAITFORVPORTSYNCDATA.ahk" { DD_WAITFORVPORTSYNCDATA }

/**
 * The DdVideoPortWaitForSync callback function waits until the next vertical synch occurs.
 * @remarks
 * If the condition on which the driver is waiting does not occur before the number of milliseconds specified in the  <b>dwTimeOut</b> member of the DD_WAITFORVPORTSYNCDATA structure at <i>lpWaitForSync</i> has elapsed, the driver should set the <b>ddRVal</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_waitforvportsyncdata">DD_WAITFORVPORTSYNCDATA</a> to DDERR_VIDEONOTACTIVE and return DDHAL_DRIVER_HANDLED.
 * 
 * The driver must specify its own time-out criteria when <b>dwTimeOut</b> is zero.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_vportcb_waitforsync
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_VPORTCB_WAITFORSYNC {
    value : IntPtr

    __value {
        set {
            if (value is PDD_VPORTCB_WAITFORSYNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_WAITFORVPORTSYNCDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_waitforvportsyncdata">DD_WAITFORVPORTSYNCDATA</a> structure that contains the information required for the driver to synchronize the VPE object.
     * @returns {Integer} <i>DdVideoPortWaitForSync</i> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_WAITFORVPORTSYNCDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_VPORTCB_WAITFORSYNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_VPORTCB_WAITFORSYNC {
        /**
         * Creates a PDD_VPORTCB_WAITFORSYNC pointer that invokes the given AHK function when called.
         * @param {Func(DD_WAITFORVPORTSYNCDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_WAITFORVPORTSYNCDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
