#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_PIPELINE_STATE_STREAM_DESC.ahk" { D3D12_PIPELINE_STATE_STREAM_DESC }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12PipelineStateFunc {
    value : IntPtr

    __value {
        set {
            if (value is D3D12PipelineStateFunc) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} pKey 
     * @param {Integer} KeySize 
     * @param {Integer} _Version 
     * @param {Pointer<D3D12_PIPELINE_STATE_STREAM_DESC>} pDesc 
     * @param {Pointer<Void>} pContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pKey, KeySize, _Version, pDesc, pContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, IntPtr, pKey, UInt32, KeySize, UInt32, _Version, D3D12_PIPELINE_STATE_STREAM_DESC.Ptr, pDesc, pContextMarshal, pContext)
    }

    /**
     * A D3D12PipelineStateFunc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends D3D12PipelineStateFunc {
        /**
         * Creates a D3D12PipelineStateFunc pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, UInt32, D3D12_PIPELINE_STATE_STREAM_DESC, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, UInt32, D3D12_PIPELINE_STATE_STREAM_DESC.Ptr, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
