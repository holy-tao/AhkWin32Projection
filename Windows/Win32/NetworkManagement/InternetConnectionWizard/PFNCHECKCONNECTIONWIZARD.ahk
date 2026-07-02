#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.InternetConnectionWizard
 */
export default struct PFNCHECKCONNECTIONWIZARD {
    value : IntPtr

    __value {
        set {
            if (value is PFNCHECKCONNECTIONWIZARD) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<Integer>} param1 
     * @returns {Integer} 
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, UInt32, param0, param1Marshal, param1, UInt32)
        return result
    }

    /**
     * A PFNCHECKCONNECTIONWIZARD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNCHECKCONNECTIONWIZARD {
        /**
         * Creates a PFNCHECKCONNECTIONWIZARD pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
