#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLIPOBJ.ahk" { CLIPOBJ }
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import ".\XLATEOBJ.ahk" { XLATEOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import "..\..\Graphics\Gdi\TRIVERTEX.ahk" { TRIVERTEX }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvGradientFill {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvGradientFill) {
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
     * @param {Pointer<CLIPOBJ>} param1 
     * @param {Pointer<XLATEOBJ>} param2 
     * @param {Pointer<TRIVERTEX>} param3 
     * @param {Integer} param4 
     * @param {Pointer<Void>} param5 
     * @param {Integer} param6 
     * @param {Pointer<RECTL>} param7 
     * @param {Pointer<POINTL>} param8 
     * @param {Integer} param9 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7, param8, param9) {
        param5Marshal := param5 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, SURFOBJ.Ptr, param0, CLIPOBJ.Ptr, param1, XLATEOBJ.Ptr, param2, TRIVERTEX.Ptr, param3, UInt32, param4, param5Marshal, param5, UInt32, param6, RECTL.Ptr, param7, POINTL.Ptr, param8, UInt32, param9, BOOL)
        return result
    }

    /**
     * A PFN_DrvGradientFill that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvGradientFill {
        /**
         * Creates a PFN_DrvGradientFill pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, CLIPOBJ, XLATEOBJ, TRIVERTEX, UInt32, "ptr", UInt32, RECTL, POINTL, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 10)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 10 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, CLIPOBJ.Ptr, XLATEOBJ.Ptr, TRIVERTEX.Ptr, UInt32, "ptr", UInt32, RECTL.Ptr, POINTL.Ptr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
