#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DIDEVICEINSTANCEA.ahk" { DIDEVICEINSTANCEA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset ANSI
 */
export default struct LPDIENUMDEVICESCALLBACKA {
    value : IntPtr

    __value {
        set {
            if (value is LPDIENUMDEVICESCALLBACKA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DIDEVICEINSTANCEA>} param0 
     * @param {Pointer<Void>} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DIDEVICEINSTANCEA.Ptr, param0, param1Marshal, param1, BOOL)
        return result
    }

    /**
     * A LPDIENUMDEVICESCALLBACKA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDIENUMDEVICESCALLBACKA {
        /**
         * Creates a LPDIENUMDEVICESCALLBACKA pointer that invokes the given AHK function when called.
         * @param {Func(DIDEVICEINSTANCEA, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DIDEVICEINSTANCEA.Ptr, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
