#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DHAL_CLEARDATA.ahk" { D3DHAL_CLEARDATA }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct LPD3DHAL_CLEARCB {
    value : IntPtr

    __value {
        set {
            if (value is LPD3DHAL_CLEARCB) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<D3DHAL_CLEARDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, D3DHAL_CLEARDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPD3DHAL_CLEARCB that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPD3DHAL_CLEARCB {
        /**
         * Creates a LPD3DHAL_CLEARCB pointer that invokes the given AHK function when called.
         * @param {Func(D3DHAL_CLEARDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [D3DHAL_CLEARDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
