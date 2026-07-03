#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BLENDOBJ.ahk" { BLENDOBJ }
#Import ".\CLIPOBJ.ahk" { CLIPOBJ }
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import ".\XLATEOBJ.ahk" { XLATEOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvAlphaBlend {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvAlphaBlend) {
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
     * @param {Pointer<BLENDOBJ>} param6 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6) {
        result := DllCall(this.value, SURFOBJ.Ptr, param0, SURFOBJ.Ptr, param1, CLIPOBJ.Ptr, param2, XLATEOBJ.Ptr, param3, RECTL.Ptr, param4, RECTL.Ptr, param5, BLENDOBJ.Ptr, param6, BOOL)
        return result
    }

    /**
     * A PFN_DrvAlphaBlend that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvAlphaBlend {
        /**
         * Creates a PFN_DrvAlphaBlend pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, SURFOBJ, CLIPOBJ, XLATEOBJ, RECTL, RECTL, BLENDOBJ) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, SURFOBJ.Ptr, CLIPOBJ.Ptr, XLATEOBJ.Ptr, RECTL.Ptr, RECTL.Ptr, BLENDOBJ.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
