#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLIPOBJ.ahk" { CLIPOBJ }
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import ".\XLATEOBJ.ahk" { XLATEOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvCopyBits {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvCopyBits) {
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
     * @param {Pointer<POINTL>} param5 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5) {
        result := DllCall(this.value, SURFOBJ.Ptr, param0, SURFOBJ.Ptr, param1, CLIPOBJ.Ptr, param2, XLATEOBJ.Ptr, param3, RECTL.Ptr, param4, POINTL.Ptr, param5, BOOL)
        return result
    }

    /**
     * A PFN_DrvCopyBits that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvCopyBits {
        /**
         * Creates a PFN_DrvCopyBits pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, SURFOBJ, CLIPOBJ, XLATEOBJ, RECTL, POINTL) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, SURFOBJ.Ptr, CLIPOBJ.Ptr, XLATEOBJ.Ptr, RECTL.Ptr, POINTL.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
