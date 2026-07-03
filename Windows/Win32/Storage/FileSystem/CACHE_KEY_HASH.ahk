#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CACHE_KEY_HASH {
    value : IntPtr

    __value {
        set {
            if (value is CACHE_KEY_HASH) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} lpbKey 
     * @param {Integer} cbKey 
     * @returns {Integer} 
     */
    Call(lpbKey, cbKey) {
        lpbKeyMarshal := lpbKey is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, lpbKeyMarshal, lpbKey, UInt32, cbKey, UInt32)
        return result
    }

    /**
     * A CACHE_KEY_HASH that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CACHE_KEY_HASH {
        /**
         * Creates a CACHE_KEY_HASH pointer that invokes the given AHK function when called.
         * @param {Func("char*", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["char*", UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
