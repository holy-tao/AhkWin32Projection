#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PDD_GETVPORTAUTOFLIPSURFACEDATA.ahk" { PDD_GETVPORTAUTOFLIPSURFACEDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_VPORTCB_GETAUTOFLIPSURF {
    value : IntPtr

    __value {
        set {
            if (value is PDD_VPORTCB_GETAUTOFLIPSURF) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PDD_GETVPORTAUTOFLIPSURFACEDATA} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, PDD_GETVPORTAUTOFLIPSURFACEDATA, param0, UInt32)
        return result
    }

    /**
     * A PDD_VPORTCB_GETAUTOFLIPSURF that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_VPORTCB_GETAUTOFLIPSURF {
        /**
         * Creates a PDD_VPORTCB_GETAUTOFLIPSURF pointer that invokes the given AHK function when called.
         * @param {Func(PDD_GETVPORTAUTOFLIPSURFACEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PDD_GETVPORTAUTOFLIPSURFACEDATA, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
