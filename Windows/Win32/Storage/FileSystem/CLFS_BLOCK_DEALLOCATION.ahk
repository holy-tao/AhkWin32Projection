#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLFS_BLOCK_DEALLOCATION {
    value : IntPtr

    __value {
        set {
            if (value is CLFS_BLOCK_DEALLOCATION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvBuffer 
     * @param {Pointer<Void>} pvUserContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pvBuffer, pvUserContext) {
        pvBufferMarshal := pvBuffer is VarRef ? "ptr" : "ptr"
        pvUserContextMarshal := pvUserContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, pvBufferMarshal, pvBuffer, pvUserContextMarshal, pvUserContext)
    }

    /**
     * A CLFS_BLOCK_DEALLOCATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CLFS_BLOCK_DEALLOCATION {
        /**
         * Creates a CLFS_BLOCK_DEALLOCATION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
