#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * A callback that is provided to the cache to help examine items within the cache.
 * @see https://learn.microsoft.com/windows/win32/api/filehc/nc-filehc-cache_read_callback
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CACHE_READ_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is CACHE_READ_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} cb The size, in bytes, of the data indicated in the <i>lpb</i> parameter.
     * @param {Pointer<Integer>} lpb A pointer to the data portion of the key.
     * @param {Pointer<Void>} lpvContext The context that is specified by the user.
     * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds; otherwise, it returns <b>FALSE</b>.
     * 
     * <div class="alert"><b>Note</b>  This return value is ignored.</div>
     * <div> </div>
     */
    Call(cb, lpb, lpvContext) {
        lpbMarshal := lpb is VarRef ? "char*" : "ptr"
        lpvContextMarshal := lpvContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, cb, lpbMarshal, lpb, lpvContextMarshal, lpvContext, BOOL)
        return result
    }

    /**
     * A CACHE_READ_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CACHE_READ_CALLBACK {
        /**
         * Creates a CACHE_READ_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "char*", "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "char*", "ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
