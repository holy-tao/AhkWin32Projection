#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A function that is called whenever an entry in the name cache is destroyed.
 * @remarks
 * If the client does not associate data with the name, this function is called only for the key data.
 * @see https://learn.microsoft.com/windows/win32/api/filehc/nc-filehc-cache_destroy_callback
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CACHE_DESTROY_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is CACHE_DESTROY_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} cb The size of the data or key pointed to by the <i>lpb</i> parameter, in bytes.
     * @param {Pointer<Integer>} lpb A pointer to the data or key.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(cb, lpb) {
        lpbMarshal := lpb is VarRef ? "char*" : "ptr"

        DllCall(this.value, UInt32, cb, lpbMarshal, lpb)
    }

    /**
     * A CACHE_DESTROY_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CACHE_DESTROY_CALLBACK {
        /**
         * Creates a CACHE_DESTROY_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "char*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "char*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
