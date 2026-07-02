#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DIFILEEFFECT.ahk" { DIFILEEFFECT }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct LPDIENUMEFFECTSINFILECALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPDIENUMEFFECTSINFILECALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DIFILEEFFECT>} param0 
     * @param {Pointer<Void>} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DIFILEEFFECT.Ptr, param0, param1Marshal, param1, BOOL)
        return result
    }

    /**
     * A LPDIENUMEFFECTSINFILECALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDIENUMEFFECTSINFILECALLBACK {
        /**
         * Creates a LPDIENUMEFFECTSINFILECALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(DIFILEEFFECT, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DIFILEEFFECT.Ptr, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
