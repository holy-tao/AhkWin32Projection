#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DHAL_TEXTURESWAPDATA.ahk" { D3DHAL_TEXTURESWAPDATA }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct LPD3DHAL_TEXTURESWAPCB {
    value : IntPtr

    __value {
        set {
            if (value is LPD3DHAL_TEXTURESWAPCB) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<D3DHAL_TEXTURESWAPDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, D3DHAL_TEXTURESWAPDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPD3DHAL_TEXTURESWAPCB that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPD3DHAL_TEXTURESWAPCB {
        /**
         * Creates a LPD3DHAL_TEXTURESWAPCB pointer that invokes the given AHK function when called.
         * @param {Func(D3DHAL_TEXTURESWAPDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [D3DHAL_TEXTURESWAPDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
