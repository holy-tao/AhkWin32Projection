#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLIPOBJ.ahk" { CLIPOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import ".\XLATEOBJ.ahk" { XLATEOBJ }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvTransparentBlt {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvTransparentBlt) {
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
     * @param {Pointer<CLIPOBJ>} param2 
     * @param {Pointer<XLATEOBJ>} param3 
     * @param {Pointer<RECTL>} param4 
     * @param {Pointer<RECTL>} param5 
     * @param {Integer} param6 
     * @param {Integer} param7 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7) {
        result := DllCall(this.value, SURFOBJ.Ptr, param0, SURFOBJ.Ptr, param1, CLIPOBJ.Ptr, param2, XLATEOBJ.Ptr, param3, RECTL.Ptr, param4, RECTL.Ptr, param5, UInt32, param6, UInt32, param7, BOOL)
        return result
    }

    /**
     * A PFN_DrvTransparentBlt that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvTransparentBlt {
        /**
         * Creates a PFN_DrvTransparentBlt pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, SURFOBJ, CLIPOBJ, XLATEOBJ, RECTL, RECTL, UInt32, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, SURFOBJ.Ptr, CLIPOBJ.Ptr, XLATEOBJ.Ptr, RECTL.Ptr, RECTL.Ptr, UInt32, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
