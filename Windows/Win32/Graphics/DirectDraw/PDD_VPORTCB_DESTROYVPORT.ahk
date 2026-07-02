#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_DESTROYVPORTDATA.ahk" { DD_DESTROYVPORTDATA }

/**
 * The DdVideoPortDestroy callback function notifies the driver that DirectDraw has destroyed the specified VPE object.
 * @remarks
 * <b>DdVideoPortDestroy</b> can be optionally implemented in DirectDraw drivers that support VPE.
 * 
 * The driver should free any memory that it allocated and associated with the specified VPE object. This includes freeing any driver-allocated memory accessed through the <b>dwReserved1</b> and <b>dwReserved2</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_videoport_local">DD_VIDEOPORT_LOCAL</a> structure. This DD_VIDEOPORT_LOCAL structure is at the <b>lpVideoPort</b> member of the DD_DESTROYVPORTDATA structure at <i>lpDestroyVideoPort</i>.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_vportcb_destroyvport
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_VPORTCB_DESTROYVPORT {
    value : IntPtr

    __value {
        set {
            if (value is PDD_VPORTCB_DESTROYVPORT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_DESTROYVPORTDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_destroyvportdata">DD_DESTROYVPORTDATA</a> structure that contains the information required for the driver to clean up.
     * @returns {Integer} <b>DdVideoPortDestroy</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_DESTROYVPORTDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_VPORTCB_DESTROYVPORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_VPORTCB_DESTROYVPORT {
        /**
         * Creates a PDD_VPORTCB_DESTROYVPORT pointer that invokes the given AHK function when called.
         * @param {Func(DD_DESTROYVPORTDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_DESTROYVPORTDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
