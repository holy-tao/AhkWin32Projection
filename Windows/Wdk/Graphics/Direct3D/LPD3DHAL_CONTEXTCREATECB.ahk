#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DHAL_CONTEXTCREATEDATA.ahk" { D3DHAL_CONTEXTCREATEDATA }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct LPD3DHAL_CONTEXTCREATECB {
    value : IntPtr

    __value {
        set {
            if (value is LPD3DHAL_CONTEXTCREATECB) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<D3DHAL_CONTEXTCREATEDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, D3DHAL_CONTEXTCREATEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPD3DHAL_CONTEXTCREATECB that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPD3DHAL_CONTEXTCREATECB {
        /**
         * Creates a LPD3DHAL_CONTEXTCREATECB pointer that invokes the given AHK function when called.
         * @param {Func(D3DHAL_CONTEXTCREATEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [D3DHAL_CONTEXTCREATEDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
