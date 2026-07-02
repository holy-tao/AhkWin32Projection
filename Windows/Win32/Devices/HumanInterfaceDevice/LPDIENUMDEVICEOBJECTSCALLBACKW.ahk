#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DIDEVICEOBJECTINSTANCEW.ahk" { DIDEVICEOBJECTINSTANCEW }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset Unicode
 */
export default struct LPDIENUMDEVICEOBJECTSCALLBACKW {
    value : IntPtr

    __value {
        set {
            if (value is LPDIENUMDEVICEOBJECTSCALLBACKW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DIDEVICEOBJECTINSTANCEW>} param0 
     * @param {Pointer<Void>} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DIDEVICEOBJECTINSTANCEW.Ptr, param0, param1Marshal, param1, BOOL)
        return result
    }

    /**
     * A LPDIENUMDEVICEOBJECTSCALLBACKW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDIENUMDEVICEOBJECTSCALLBACKW {
        /**
         * Creates a LPDIENUMDEVICEOBJECTSCALLBACKW pointer that invokes the given AHK function when called.
         * @param {Func(DIDEVICEOBJECTINSTANCEW, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DIDEVICEOBJECTINSTANCEW.Ptr, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
