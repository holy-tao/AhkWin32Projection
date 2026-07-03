#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BRUSHOBJ.ahk" { BRUSHOBJ }
#Import ".\CLIPOBJ.ahk" { CLIPOBJ }
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvLineTo {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvLineTo) {
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
     * @param {Pointer<BRUSHOBJ>} param2 
     * @param {Integer} param3 
     * @param {Integer} param4 
     * @param {Integer} param5 
     * @param {Integer} param6 
     * @param {Pointer<RECTL>} param7 
     * @param {Integer} param8 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7, param8) {
        result := DllCall(this.value, SURFOBJ.Ptr, param0, CLIPOBJ.Ptr, param1, BRUSHOBJ.Ptr, param2, Int32, param3, Int32, param4, Int32, param5, Int32, param6, RECTL.Ptr, param7, UInt32, param8, BOOL)
        return result
    }

    /**
     * A PFN_DrvLineTo that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvLineTo {
        /**
         * Creates a PFN_DrvLineTo pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, CLIPOBJ, BRUSHOBJ, Int32, Int32, Int32, Int32, RECTL, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, CLIPOBJ.Ptr, BRUSHOBJ.Ptr, Int32, Int32, Int32, Int32, RECTL.Ptr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
