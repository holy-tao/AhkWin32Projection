#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12CompilerCacheSessionAllocationFunc {
    value : IntPtr

    __value {
        set {
            if (value is D3D12CompilerCacheSessionAllocationFunc) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} SizeInBytes 
     * @param {Pointer<Void>} pContext 
     * @returns {Pointer<Void>} 
     */
    Call(SizeInBytes, pContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, SizeInBytes, pContextMarshal, pContext, IntPtr)
        return result
    }

    /**
     * A D3D12CompilerCacheSessionAllocationFunc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends D3D12CompilerCacheSessionAllocationFunc {
        /**
         * Creates a D3D12CompilerCacheSessionAllocationFunc pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, "ptr") => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "ptr", "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
