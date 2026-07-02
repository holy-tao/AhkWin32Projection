#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_SETCOLORKEYDATA.ahk" { DD_SETCOLORKEYDATA }

/**
 * The DdSetColorKey callback function sets the color key value for the specified surface.
 * @remarks
 * <i>DdSetColorKey</i> sets the source or destination color key for the specified surface. Typically, this callback is implemented only for drivers that support overlays with color key capabilities.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_surfcb_setcolorkey
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_SURFCB_SETCOLORKEY {
    value : IntPtr

    __value {
        set {
            if (value is PDD_SURFCB_SETCOLORKEY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_SETCOLORKEYDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_setcolorkeydata">DD_SETCOLORKEYDATA</a> structure that contains the information required to set the color key for the specified surface.
     * @returns {Integer} <i>DdSetColorKey</i> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_SETCOLORKEYDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_SURFCB_SETCOLORKEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_SURFCB_SETCOLORKEY {
        /**
         * Creates a PDD_SURFCB_SETCOLORKEY pointer that invokes the given AHK function when called.
         * @param {Func(DD_SETCOLORKEYDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_SETCOLORKEYDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
