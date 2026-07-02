#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DIEFFECTINFOW.ahk" { DIEFFECTINFOW }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset Unicode
 */
export default struct LPDIENUMEFFECTSCALLBACKW {
    value : IntPtr

    __value {
        set {
            if (value is LPDIENUMEFFECTSCALLBACKW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DIEFFECTINFOW>} param0 
     * @param {Pointer<Void>} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DIEFFECTINFOW.Ptr, param0, param1Marshal, param1, BOOL)
        return result
    }

    /**
     * A LPDIENUMEFFECTSCALLBACKW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDIENUMEFFECTSCALLBACKW {
        /**
         * Creates a LPDIENUMEFFECTSCALLBACKW pointer that invokes the given AHK function when called.
         * @param {Func(DIEFFECTINFOW, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DIEFFECTINFOW.Ptr, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
