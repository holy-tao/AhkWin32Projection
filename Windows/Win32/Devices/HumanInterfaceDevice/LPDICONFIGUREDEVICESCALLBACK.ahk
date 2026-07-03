#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct LPDICONFIGUREDEVICESCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPDICONFIGUREDEVICESCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IUnknown} param0 
     * @param {Pointer<Void>} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", param0, param1Marshal, param1, BOOL)
        return result
    }

    /**
     * A LPDICONFIGUREDEVICESCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDICONFIGUREDEVICESCALLBACK {
        /**
         * Creates a LPDICONFIGUREDEVICESCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
