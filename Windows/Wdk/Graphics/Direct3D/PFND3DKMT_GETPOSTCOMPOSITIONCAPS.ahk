#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\D3DKMT_GET_POST_COMPOSITION_CAPS.ahk" { D3DKMT_GET_POST_COMPOSITION_CAPS }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct PFND3DKMT_GETPOSTCOMPOSITIONCAPS {
    value : IntPtr

    __value {
        set {
            if (value is PFND3DKMT_GETPOSTCOMPOSITIONCAPS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<D3DKMT_GET_POST_COMPOSITION_CAPS>} param0 
     * @returns {NTSTATUS} 
     */
    Call(param0) {
        result := DllCall(this.value, D3DKMT_GET_POST_COMPOSITION_CAPS.Ptr, param0, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PFND3DKMT_GETPOSTCOMPOSITIONCAPS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFND3DKMT_GETPOSTCOMPOSITIONCAPS {
        /**
         * Creates a PFND3DKMT_GETPOSTCOMPOSITIONCAPS pointer that invokes the given AHK function when called.
         * @param {Func(D3DKMT_GET_POST_COMPOSITION_CAPS) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [D3DKMT_GET_POST_COMPOSITION_CAPS.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
