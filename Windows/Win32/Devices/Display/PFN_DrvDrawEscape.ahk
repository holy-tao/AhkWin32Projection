#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLIPOBJ.ahk" { CLIPOBJ }
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvDrawEscape {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvDrawEscape) {
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
     * @param {Integer} param1 
     * @param {Pointer<CLIPOBJ>} param2 
     * @param {Pointer<RECTL>} param3 
     * @param {Integer} param4 
     * @param {Pointer<Void>} param5 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3, param4, param5) {
        param5Marshal := param5 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, SURFOBJ.Ptr, param0, UInt32, param1, CLIPOBJ.Ptr, param2, RECTL.Ptr, param3, UInt32, param4, param5Marshal, param5, UInt32)
        return result
    }

    /**
     * A PFN_DrvDrawEscape that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvDrawEscape {
        /**
         * Creates a PFN_DrvDrawEscape pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, UInt32, CLIPOBJ, RECTL, UInt32, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, UInt32, CLIPOBJ.Ptr, RECTL.Ptr, UInt32, "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
