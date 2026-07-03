#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_COMPILER_CACHE_VALUE_KEY.ahk" { D3D12_COMPILER_CACHE_VALUE_KEY }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12CompilerCacheSessionGroupValueKeysFunc {
    value : IntPtr

    __value {
        set {
            if (value is D3D12CompilerCacheSessionGroupValueKeysFunc) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_CACHE_VALUE_KEY>} pValueKey 
     * @param {Pointer<Void>} pContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pValueKey, pContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, D3D12_COMPILER_CACHE_VALUE_KEY.Ptr, pValueKey, pContextMarshal, pContext)
    }

    /**
     * A D3D12CompilerCacheSessionGroupValueKeysFunc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends D3D12CompilerCacheSessionGroupValueKeysFunc {
        /**
         * Creates a D3D12CompilerCacheSessionGroupValueKeysFunc pointer that invokes the given AHK function when called.
         * @param {Func(D3D12_COMPILER_CACHE_VALUE_KEY, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [D3D12_COMPILER_CACHE_VALUE_KEY.Ptr, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
