#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BRUSHOBJ.ahk" { BRUSHOBJ }
#Import ".\CLIPOBJ.ahk" { CLIPOBJ }
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import ".\XLATEOBJ.ahk" { XLATEOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import "..\..\Graphics\Gdi\COLORADJUSTMENT.ahk" { COLORADJUSTMENT }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvStretchBltROP {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvStretchBltROP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SURFOBJ>} param0 
     * @param {Pointer<SURFOBJ>} param1 
     * @param {Pointer<SURFOBJ>} param2 
     * @param {Pointer<CLIPOBJ>} param3 
     * @param {Pointer<XLATEOBJ>} param4 
     * @param {Pointer<COLORADJUSTMENT>} param5 
     * @param {Pointer<POINTL>} param6 
     * @param {Pointer<RECTL>} param7 
     * @param {Pointer<RECTL>} param8 
     * @param {Pointer<POINTL>} param9 
     * @param {Integer} param10 
     * @param {Pointer<BRUSHOBJ>} param11 
     * @param {Integer} param12 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12) {
        result := DllCall(this.value, SURFOBJ.Ptr, param0, SURFOBJ.Ptr, param1, SURFOBJ.Ptr, param2, CLIPOBJ.Ptr, param3, XLATEOBJ.Ptr, param4, COLORADJUSTMENT.Ptr, param5, POINTL.Ptr, param6, RECTL.Ptr, param7, RECTL.Ptr, param8, POINTL.Ptr, param9, UInt32, param10, BRUSHOBJ.Ptr, param11, UInt32, param12, BOOL)
        return result
    }

    /**
     * A PFN_DrvStretchBltROP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvStretchBltROP {
        /**
         * Creates a PFN_DrvStretchBltROP pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, SURFOBJ, SURFOBJ, CLIPOBJ, XLATEOBJ, COLORADJUSTMENT, POINTL, RECTL, RECTL, POINTL, UInt32, BRUSHOBJ, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 13)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 13 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, SURFOBJ.Ptr, SURFOBJ.Ptr, CLIPOBJ.Ptr, XLATEOBJ.Ptr, COLORADJUSTMENT.Ptr, POINTL.Ptr, RECTL.Ptr, RECTL.Ptr, POINTL.Ptr, UInt32, BRUSHOBJ.Ptr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
