#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRESOURCE.ahk" { HRESOURCE }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * The LPRESOURCE_CALLBACK_EX callback function is accessible by another function and is invoked after the first function completes. (LPRESOURCE_CALLBACK_EX)
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-lpresource_callback_ex
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct LPRESOURCE_CALLBACK_EX {
    value : IntPtr

    __value {
        set {
            if (value is LPRESOURCE_CALLBACK_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCLUSTER} param0 
     * @param {HRESOURCE} param1 
     * @param {HRESOURCE} param2 
     * @param {Pointer<Void>} param3 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3) {
        param3Marshal := param3 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HCLUSTER, param0, HRESOURCE, param1, HRESOURCE, param2, param3Marshal, param3, UInt32)
        return result
    }

    /**
     * A LPRESOURCE_CALLBACK_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPRESOURCE_CALLBACK_EX {
        /**
         * Creates a LPRESOURCE_CALLBACK_EX pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, HRESOURCE, HRESOURCE, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, HRESOURCE, HRESOURCE, "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
