#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Diagnostics\Debug\DEBUG_EVENT.ahk" { DEBUG_EVENT }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct DEBUGEVENTPROC {
    value : IntPtr

    __value {
        set {
            if (value is DEBUGEVENTPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DEBUG_EVENT>} param0 
     * @param {Pointer<Void>} param1 
     * @returns {Integer} 
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DEBUG_EVENT.Ptr, param0, param1Marshal, param1, UInt32)
        return result
    }

    /**
     * A DEBUGEVENTPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DEBUGEVENTPROC {
        /**
         * Creates a DEBUGEVENTPROC pointer that invokes the given AHK function when called.
         * @param {Func(DEBUG_EVENT, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEBUG_EVENT.Ptr, "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
