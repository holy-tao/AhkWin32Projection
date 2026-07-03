#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct PCLFS_COMPLETION_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PCLFS_COMPLETION_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvOverlapped 
     * @param {Integer} ulReserved 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pvOverlapped, ulReserved) {
        pvOverlappedMarshal := pvOverlapped is VarRef ? "ptr" : "ptr"

        DllCall(this.value, pvOverlappedMarshal, pvOverlapped, UInt32, ulReserved)
    }

    /**
     * A PCLFS_COMPLETION_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLFS_COMPLETION_ROUTINE {
        /**
         * Creates a PCLFS_COMPLETION_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
