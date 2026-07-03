#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BRUSHOBJ.ahk" { BRUSHOBJ }
#Import ".\CLIPOBJ.ahk" { CLIPOBJ }
#Import ".\FONTOBJ.ahk" { FONTOBJ }
#Import ".\STROBJ.ahk" { STROBJ }
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvTextOut {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvTextOut) {
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
     * @param {Pointer<STROBJ>} param1 
     * @param {Pointer<FONTOBJ>} param2 
     * @param {Pointer<CLIPOBJ>} param3 
     * @param {Pointer<RECTL>} param4 
     * @param {Pointer<RECTL>} param5 
     * @param {Pointer<BRUSHOBJ>} param6 
     * @param {Pointer<BRUSHOBJ>} param7 
     * @param {Pointer<POINTL>} param8 
     * @param {Integer} param9 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7, param8, param9) {
        result := DllCall(this.value, SURFOBJ.Ptr, param0, STROBJ.Ptr, param1, FONTOBJ.Ptr, param2, CLIPOBJ.Ptr, param3, RECTL.Ptr, param4, RECTL.Ptr, param5, BRUSHOBJ.Ptr, param6, BRUSHOBJ.Ptr, param7, POINTL.Ptr, param8, UInt32, param9, BOOL)
        return result
    }

    /**
     * A PFN_DrvTextOut that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvTextOut {
        /**
         * Creates a PFN_DrvTextOut pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, STROBJ, FONTOBJ, CLIPOBJ, RECTL, RECTL, BRUSHOBJ, BRUSHOBJ, POINTL, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 10)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 10 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, STROBJ.Ptr, FONTOBJ.Ptr, CLIPOBJ.Ptr, RECTL.Ptr, RECTL.Ptr, BRUSHOBJ.Ptr, BRUSHOBJ.Ptr, POINTL.Ptr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
