#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BRUSHOBJ.ahk" { BRUSHOBJ }
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import ".\XLATEOBJ.ahk" { XLATEOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvRealizeBrush {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvRealizeBrush) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<BRUSHOBJ>} param0 
     * @param {Pointer<SURFOBJ>} param1 
     * @param {Pointer<SURFOBJ>} param2 
     * @param {Pointer<SURFOBJ>} param3 
     * @param {Pointer<XLATEOBJ>} param4 
     * @param {Integer} param5 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5) {
        result := DllCall(this.value, BRUSHOBJ.Ptr, param0, SURFOBJ.Ptr, param1, SURFOBJ.Ptr, param2, SURFOBJ.Ptr, param3, XLATEOBJ.Ptr, param4, UInt32, param5, BOOL)
        return result
    }

    /**
     * A PFN_DrvRealizeBrush that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvRealizeBrush {
        /**
         * Creates a PFN_DrvRealizeBrush pointer that invokes the given AHK function when called.
         * @param {Func(BRUSHOBJ, SURFOBJ, SURFOBJ, SURFOBJ, XLATEOBJ, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BRUSHOBJ.Ptr, SURFOBJ.Ptr, SURFOBJ.Ptr, SURFOBJ.Ptr, XLATEOBJ.Ptr, UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
