#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_COLORCONTROLDATA.ahk" { DD_COLORCONTROLDATA }

/**
 * The DdControlColor callback function controls the luminance and brightness controls of an overlay surface.
 * @remarks
 * <b>DdControlColor</b> can be optionally implemented in a DirectDraw driver.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_colorcb_colorcontrol
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_COLORCB_COLORCONTROL {
    value : IntPtr

    __value {
        set {
            if (value is PDD_COLORCB_COLORCONTROL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_COLORCONTROLDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_colorcontroldata">DD_COLORCONTROLDATA</a> structure that contains the color control information for a specified overlay surface.
     * @returns {Integer} <b>DdControlColor</b> returns a callback code.
     */
    Call(param0) {
        result := DllCall(this.value, DD_COLORCONTROLDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_COLORCB_COLORCONTROL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_COLORCB_COLORCONTROL {
        /**
         * Creates a PDD_COLORCB_COLORCONTROL pointer that invokes the given AHK function when called.
         * @param {Func(DD_COLORCONTROLDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_COLORCONTROLDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
