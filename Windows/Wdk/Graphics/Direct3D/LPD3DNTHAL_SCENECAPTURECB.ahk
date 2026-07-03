#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DNTHAL_SCENECAPTUREDATA.ahk" { D3DNTHAL_SCENECAPTUREDATA }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct LPD3DNTHAL_SCENECAPTURECB {
    value : IntPtr

    __value {
        set {
            if (value is LPD3DNTHAL_SCENECAPTURECB) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<D3DNTHAL_SCENECAPTUREDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, D3DNTHAL_SCENECAPTUREDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPD3DNTHAL_SCENECAPTURECB that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPD3DNTHAL_SCENECAPTURECB {
        /**
         * Creates a LPD3DNTHAL_SCENECAPTURECB pointer that invokes the given AHK function when called.
         * @param {Func(D3DNTHAL_SCENECAPTUREDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [D3DNTHAL_SCENECAPTUREDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
