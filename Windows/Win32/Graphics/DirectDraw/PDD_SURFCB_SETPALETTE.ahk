#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_SETPALETTEDATA.ahk" { DD_SETPALETTEDATA }

/**
 * The DdSetPalette callback function attaches a palette to the specified surface.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_surfcb_setpalette
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_SURFCB_SETPALETTE {
    value : IntPtr

    __value {
        set {
            if (value is PDD_SURFCB_SETPALETTE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_SETPALETTEDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_setpalettedata">DD_SETPALETTEDATA</a> structure that contains the information required to set a palette to the specified surface.
     * @returns {Integer} <b>DdSetPalette</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_SETPALETTEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_SURFCB_SETPALETTE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_SURFCB_SETPALETTE {
        /**
         * Creates a PDD_SURFCB_SETPALETTE pointer that invokes the given AHK function when called.
         * @param {Func(DD_SETPALETTEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_SETPALETTEDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
