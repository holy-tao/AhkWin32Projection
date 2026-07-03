#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import ".\XLATEOBJ.ahk" { XLATEOBJ }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvSetPointerShape {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvSetPointerShape) {
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
     * @param {Pointer<XLATEOBJ>} param3 
     * @param {Integer} param4 
     * @param {Integer} param5 
     * @param {Integer} param6 
     * @param {Integer} param7 
     * @param {Pointer<RECTL>} param8 
     * @param {Integer} param9 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7, param8, param9) {
        result := DllCall(this.value, SURFOBJ.Ptr, param0, SURFOBJ.Ptr, param1, SURFOBJ.Ptr, param2, XLATEOBJ.Ptr, param3, Int32, param4, Int32, param5, Int32, param6, Int32, param7, RECTL.Ptr, param8, UInt32, param9, UInt32)
        return result
    }

    /**
     * A PFN_DrvSetPointerShape that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvSetPointerShape {
        /**
         * Creates a PFN_DrvSetPointerShape pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, SURFOBJ, SURFOBJ, XLATEOBJ, Int32, Int32, Int32, Int32, RECTL, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 10)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 10 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, SURFOBJ.Ptr, SURFOBJ.Ptr, XLATEOBJ.Ptr, Int32, Int32, Int32, Int32, RECTL.Ptr, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
