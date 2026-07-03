#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_SETEXCLUSIVEMODEDATA.ahk" { DD_SETEXCLUSIVEMODEDATA }

/**
 * The DdSetExclusiveMode callback function notifies the driver when a DirectDraw application is switching to or from exclusive mode.
 * @remarks
 * <i>DdSetExclusiveMode</i> can be optionally implemented in display drivers. Drivers for hardware that needs to be partially enabled and/or disabled to support exclusive mode should implement this function.
 * 
 * DirectDraw applications can go full screen and take total control of the primary surface. Specifically, the application is responsible for operations such as DirectDraw mode changes and primary surface flipping when in exclusive mode.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_setexclusivemode
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_SETEXCLUSIVEMODE {
    value : IntPtr

    __value {
        set {
            if (value is PDD_SETEXCLUSIVEMODE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_SETEXCLUSIVEMODEDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_setexclusivemodedata">DD_SETEXCLUSIVEMODEDATA</a> structure that contains the notification information.
     * @returns {Integer} <i>DdSetExclusiveMode</i> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_SETEXCLUSIVEMODEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_SETEXCLUSIVEMODE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_SETEXCLUSIVEMODE {
        /**
         * Creates a PDD_SETEXCLUSIVEMODE pointer that invokes the given AHK function when called.
         * @param {Func(DD_SETEXCLUSIVEMODEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_SETEXCLUSIVEMODEDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
