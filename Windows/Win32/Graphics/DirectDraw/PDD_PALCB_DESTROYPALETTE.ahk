#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_DESTROYPALETTEDATA.ahk" { DD_DESTROYPALETTEDATA }

/**
 * The DdDestroyPalette callback function destroys the specified palette.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_palcb_destroypalette
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_PALCB_DESTROYPALETTE {
    value : IntPtr

    __value {
        set {
            if (value is PDD_PALCB_DESTROYPALETTE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_DESTROYPALETTEDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_destroypalettedata">DD_DESTROYPALETTEDATA</a> structure that contains the information needed to destroy a palette.
     * @returns {Integer} <b>DdDestroyPalette</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_DESTROYPALETTEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_PALCB_DESTROYPALETTE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_PALCB_DESTROYPALETTE {
        /**
         * Creates a PDD_PALCB_DESTROYPALETTE pointer that invokes the given AHK function when called.
         * @param {Func(DD_DESTROYPALETTEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_DESTROYPALETTEDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
