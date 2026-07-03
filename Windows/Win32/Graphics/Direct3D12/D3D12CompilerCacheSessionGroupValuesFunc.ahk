#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_COMPILER_CACHE_TYPED_CONST_VALUE.ahk" { D3D12_COMPILER_CACHE_TYPED_CONST_VALUE }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12CompilerCacheSessionGroupValuesFunc {
    value : IntPtr

    __value {
        set {
            if (value is D3D12CompilerCacheSessionGroupValuesFunc) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} ValueKeyIndex 
     * @param {Pointer<D3D12_COMPILER_CACHE_TYPED_CONST_VALUE>} pTypedValue 
     * @param {Pointer<Void>} pContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(ValueKeyIndex, pTypedValue, pContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, UInt32, ValueKeyIndex, D3D12_COMPILER_CACHE_TYPED_CONST_VALUE.Ptr, pTypedValue, pContextMarshal, pContext)
    }

    /**
     * A D3D12CompilerCacheSessionGroupValuesFunc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends D3D12CompilerCacheSessionGroupValuesFunc {
        /**
         * Creates a D3D12CompilerCacheSessionGroupValuesFunc pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, D3D12_COMPILER_CACHE_TYPED_CONST_VALUE, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, D3D12_COMPILER_CACHE_TYPED_CONST_VALUE.Ptr, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
