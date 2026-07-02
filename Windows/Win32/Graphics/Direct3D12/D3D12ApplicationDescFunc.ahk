#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_APPLICATION_DESC.ahk" { D3D12_APPLICATION_DESC }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12ApplicationDescFunc {
    value : IntPtr

    __value {
        set {
            if (value is D3D12ApplicationDescFunc) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<D3D12_APPLICATION_DESC>} pApplicationDesc 
     * @param {Pointer<Void>} pContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pApplicationDesc, pContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, D3D12_APPLICATION_DESC.Ptr, pApplicationDesc, pContextMarshal, pContext)
    }

    /**
     * A D3D12ApplicationDescFunc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends D3D12ApplicationDescFunc {
        /**
         * Creates a D3D12ApplicationDescFunc pointer that invokes the given AHK function when called.
         * @param {Func(D3D12_APPLICATION_DESC, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [D3D12_APPLICATION_DESC.Ptr, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
