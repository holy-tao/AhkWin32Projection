#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\DirectDraw\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }
#Import "..\..\Graphics\DirectDraw\DD_SURFACE_LOCAL.ahk" { DD_SURFACE_LOCAL }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvDeriveSurface {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvDeriveSurface) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_DIRECTDRAW_GLOBAL>} param0 
     * @param {Pointer<DD_SURFACE_LOCAL>} param1 
     * @returns {HBITMAP} 
     */
    Call(param0, param1) {
        result := DllCall(this.value, DD_DIRECTDRAW_GLOBAL.Ptr, param0, DD_SURFACE_LOCAL.Ptr, param1, HBITMAP.Owned)
        return result
    }

    /**
     * A PFN_DrvDeriveSurface that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvDeriveSurface {
        /**
         * Creates a PFN_DrvDeriveSurface pointer that invokes the given AHK function when called.
         * @param {Func(DD_DIRECTDRAW_GLOBAL, DD_SURFACE_LOCAL) => HBITMAP} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_DIRECTDRAW_GLOBAL.Ptr, DD_SURFACE_LOCAL.Ptr, HBITMAP])
        }

        __Delete() => CallbackFree(this.value)
    }
}
