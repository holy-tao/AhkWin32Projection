#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DIEFFECTINFOA.ahk" { DIEFFECTINFOA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset ANSI
 */
export default struct LPDIENUMEFFECTSCALLBACKA {
    value : IntPtr

    __value {
        set {
            if (value is LPDIENUMEFFECTSCALLBACKA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DIEFFECTINFOA>} param0 
     * @param {Pointer<Void>} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DIEFFECTINFOA.Ptr, param0, param1Marshal, param1, BOOL)
        return result
    }

    /**
     * A LPDIENUMEFFECTSCALLBACKA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDIENUMEFFECTSCALLBACKA {
        /**
         * Creates a LPDIENUMEFFECTSCALLBACKA pointer that invokes the given AHK function when called.
         * @param {Func(DIEFFECTINFOA, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DIEFFECTINFOA.Ptr, "ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
