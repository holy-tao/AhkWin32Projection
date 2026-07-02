#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CACHE_KEY_COMPARE {
    value : IntPtr

    __value {
        set {
            if (value is CACHE_KEY_COMPARE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} cbKey1 
     * @param {Pointer<Integer>} lpbKey1 
     * @param {Integer} cbKey2 
     * @param {Pointer<Integer>} lpbKey2 
     * @returns {Integer} 
     */
    Call(cbKey1, lpbKey1, cbKey2, lpbKey2) {
        lpbKey1Marshal := lpbKey1 is VarRef ? "char*" : "ptr"
        lpbKey2Marshal := lpbKey2 is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, UInt32, cbKey1, lpbKey1Marshal, lpbKey1, UInt32, cbKey2, lpbKey2Marshal, lpbKey2, Int32)
        return result
    }

    /**
     * A CACHE_KEY_COMPARE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CACHE_KEY_COMPARE {
        /**
         * Creates a CACHE_KEY_COMPARE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "char*", UInt32, "char*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "char*", UInt32, "char*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
