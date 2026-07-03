#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_DESTROYMOCOMPDATA.ahk" { DD_DESTROYMOCOMPDATA }

/**
 * The DdMoCompDestroy callback function notifies the driver that this motion compensation object will no longer be used. The driver now needs to perform any necessary cleanup.
 * @remarks
 * <b>DdMoCompDestroy</b> can be optionally implemented in DirectDraw drivers. It is not required for motion compensation support.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_mocompcb_destroy
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_MOCOMPCB_DESTROY {
    value : IntPtr

    __value {
        set {
            if (value is PDD_MOCOMPCB_DESTROY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_DESTROYMOCOMPDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_destroymocompdata">DD_DESTROYMOCOMPDATA</a> structure that contains the information needed to finish motion compensation.
     * @returns {Integer} <b>DdMoCompDestroy</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_DESTROYMOCOMPDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_MOCOMPCB_DESTROY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_MOCOMPCB_DESTROY {
        /**
         * Creates a PDD_MOCOMPCB_DESTROY pointer that invokes the given AHK function when called.
         * @param {Func(DD_DESTROYMOCOMPDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_DESTROYMOCOMPDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
