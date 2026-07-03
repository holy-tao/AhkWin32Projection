#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_CREATEPALETTEDATA.ahk" { DD_CREATEPALETTEDATA }

/**
 * The DdCreatePalette callback function creates a DirectDrawPalette object for the specified DirectDraw object.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_createpalette
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_CREATEPALETTE {
    value : IntPtr

    __value {
        set {
            if (value is PDD_CREATEPALETTE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_CREATEPALETTEDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_createpalettedata">DD_CREATEPALETTEDATA</a> structure that contains the information necessary to create the DirectDrawPalette object.
     * @returns {Integer} <b>DdCreatePalette</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_CREATEPALETTEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_CREATEPALETTE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_CREATEPALETTE {
        /**
         * Creates a PDD_CREATEPALETTE pointer that invokes the given AHK function when called.
         * @param {Func(DD_CREATEPALETTEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_CREATEPALETTEDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
