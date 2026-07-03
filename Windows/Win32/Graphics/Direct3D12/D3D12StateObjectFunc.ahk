#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_STATE_OBJECT_DESC.ahk" { D3D12_STATE_OBJECT_DESC }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12StateObjectFunc {
    value : IntPtr

    __value {
        set {
            if (value is D3D12StateObjectFunc) {
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
     * @param {Pointer<D3D12_STATE_OBJECT_DESC>} pDesc 
     * @param {Integer} pParentKey 
     * @param {Integer} ParentKeySize 
     * @param {Pointer<Void>} pContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pKey, KeySize, _Version, pDesc, pParentKey, ParentKeySize, pContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, IntPtr, pKey, UInt32, KeySize, UInt32, _Version, D3D12_STATE_OBJECT_DESC.Ptr, pDesc, IntPtr, pParentKey, UInt32, ParentKeySize, pContextMarshal, pContext)
    }

    /**
     * A D3D12StateObjectFunc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends D3D12StateObjectFunc {
        /**
         * Creates a D3D12StateObjectFunc pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, UInt32, D3D12_STATE_OBJECT_DESC, IntPtr, UInt32, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, UInt32, D3D12_STATE_OBJECT_DESC.Ptr, IntPtr, UInt32, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
