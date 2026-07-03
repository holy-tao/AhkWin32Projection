#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXTDLL_ITERATERTLBALANCEDNODES {
    value : IntPtr

    __value {
        set {
            if (value is EXTDLL_ITERATERTLBALANCEDNODES) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} RootNode 
     * @param {Integer} EntryOffset 
     * @param {Pointer<ENTRY_CALLBACK>} Callback 
     * @param {Pointer<Void>} CallbackContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(RootNode, EntryOffset, Callback, CallbackContext) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, Int64, RootNode, UInt32, EntryOffset, "ptr", Callback, CallbackContextMarshal, CallbackContext)
    }

    /**
     * A EXTDLL_ITERATERTLBALANCEDNODES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXTDLL_ITERATERTLBALANCEDNODES {
        /**
         * Creates a EXTDLL_ITERATERTLBALANCEDNODES pointer that invokes the given AHK function when called.
         * @param {Func(Int64, UInt32, "ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int64, UInt32, "ptr", "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
