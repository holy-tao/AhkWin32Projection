#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DHAL_TEXTUREGETSURFDATA.ahk" { D3DHAL_TEXTUREGETSURFDATA }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct LPD3DHAL_TEXTUREGETSURFCB {
    value : IntPtr

    __value {
        set {
            if (value is LPD3DHAL_TEXTUREGETSURFCB) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<D3DHAL_TEXTUREGETSURFDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, D3DHAL_TEXTUREGETSURFDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPD3DHAL_TEXTUREGETSURFCB that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPD3DHAL_TEXTUREGETSURFCB {
        /**
         * Creates a LPD3DHAL_TEXTUREGETSURFCB pointer that invokes the given AHK function when called.
         * @param {Func(D3DHAL_TEXTUREGETSURFDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [D3DHAL_TEXTUREGETSURFDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
