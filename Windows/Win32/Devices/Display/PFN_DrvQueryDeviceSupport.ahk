#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import ".\XFORMOBJ.ahk" { XFORMOBJ }
#Import ".\XLATEOBJ.ahk" { XLATEOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvQueryDeviceSupport {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvQueryDeviceSupport) {
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
     * @param {Pointer<XLATEOBJ>} param1 
     * @param {Pointer<XFORMOBJ>} param2 
     * @param {Integer} param3 
     * @param {Integer} param4 
     * @param {Pointer<Void>} param5 
     * @param {Integer} param6 
     * @param {Pointer<Void>} param7 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7) {
        param5Marshal := param5 is VarRef ? "ptr" : "ptr"
        param7Marshal := param7 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, SURFOBJ.Ptr, param0, XLATEOBJ.Ptr, param1, XFORMOBJ.Ptr, param2, UInt32, param3, UInt32, param4, param5Marshal, param5, UInt32, param6, param7Marshal, param7, BOOL)
        return result
    }

    /**
     * A PFN_DrvQueryDeviceSupport that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvQueryDeviceSupport {
        /**
         * Creates a PFN_DrvQueryDeviceSupport pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, XLATEOBJ, XFORMOBJ, UInt32, UInt32, "ptr", UInt32, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, XLATEOBJ.Ptr, XFORMOBJ.Ptr, UInt32, UInt32, "ptr", UInt32, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
