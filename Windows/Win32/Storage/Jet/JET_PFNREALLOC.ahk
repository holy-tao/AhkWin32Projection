#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_PFNREALLOC delegate
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-pfnrealloc-delegate
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_PFNREALLOC {
    value : IntPtr

    __value {
        set {
            if (value is JET_PFNREALLOC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvContext 
     * @param {Pointer<Void>} pv 
     * @param {Integer} cb 
     * @returns {Pointer<Void>} 
     */
    Call(pvContext, pv, cb) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvContextMarshal, pvContext, pvMarshal, pv, UInt32, cb, IntPtr)
        return result
    }

    /**
     * A JET_PFNREALLOC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends JET_PFNREALLOC {
        /**
         * Creates a JET_PFNREALLOC pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", UInt32) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", UInt32, "ptr"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
