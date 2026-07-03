#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_CHECKOCCLUSION.ahk" { D3DKMT_CHECKOCCLUSION }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct PFND3DKMT_CHECKOCCLUSION {
    value : IntPtr

    __value {
        set {
            if (value is PFND3DKMT_CHECKOCCLUSION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CHECKOCCLUSION>} param0 
     * @returns {NTSTATUS} 
     */
    Call(param0) {
        result := DllCall(this.value, D3DKMT_CHECKOCCLUSION.Ptr, param0, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PFND3DKMT_CHECKOCCLUSION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFND3DKMT_CHECKOCCLUSION {
        /**
         * Creates a PFND3DKMT_CHECKOCCLUSION pointer that invokes the given AHK function when called.
         * @param {Func(D3DKMT_CHECKOCCLUSION) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [D3DKMT_CHECKOCCLUSION.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
