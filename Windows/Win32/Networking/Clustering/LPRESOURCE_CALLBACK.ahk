#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * The LPRESOURCE_CALLBACK callback function is accessible by another function and is invoked after the first function completes. (LPRESOURCE_CALLBACK)
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-lpresource_callback
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct LPRESOURCE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPRESOURCE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HRESOURCE} param0 
     * @param {HRESOURCE} param1 
     * @param {Pointer<Void>} param2 
     * @returns {Integer} 
     */
    Call(param0, param1, param2) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HRESOURCE, param0, HRESOURCE, param1, param2Marshal, param2, UInt32)
        return result
    }

    /**
     * A LPRESOURCE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPRESOURCE_CALLBACK {
        /**
         * Creates a LPRESOURCE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HRESOURCE, HRESOURCE, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESOURCE, HRESOURCE, "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
