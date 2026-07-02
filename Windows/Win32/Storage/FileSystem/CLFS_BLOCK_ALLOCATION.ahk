#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLFS_BLOCK_ALLOCATION {
    value : IntPtr

    __value {
        set {
            if (value is CLFS_BLOCK_ALLOCATION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} cbBufferLength 
     * @param {Pointer<Void>} pvUserContext 
     * @returns {Pointer<Void>} 
     */
    Call(cbBufferLength, pvUserContext) {
        pvUserContextMarshal := pvUserContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, cbBufferLength, pvUserContextMarshal, pvUserContext, IntPtr)
        return result
    }

    /**
     * A CLFS_BLOCK_ALLOCATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CLFS_BLOCK_ALLOCATION {
        /**
         * Creates a CLFS_BLOCK_ALLOCATION pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr") => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr", "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
