#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IDirectInputEffect.ahk" { IDirectInputEffect }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct LPDIENUMCREATEDEFFECTOBJECTSCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPDIENUMCREATEDEFFECTOBJECTSCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDirectInputEffect} param0 
     * @param {Pointer<Void>} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", param0, param1Marshal, param1, BOOL)
        return result
    }

    /**
     * A LPDIENUMCREATEDEFFECTOBJECTSCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDIENUMCREATEDEFFECTOBJECTSCALLBACK {
        /**
         * Creates a LPDIENUMCREATEDEFFECTOBJECTSCALLBACK pointer that invokes the given AHK function when called.
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
