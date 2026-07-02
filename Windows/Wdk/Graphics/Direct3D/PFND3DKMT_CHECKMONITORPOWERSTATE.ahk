#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_CHECKMONITORPOWERSTATE.ahk" { D3DKMT_CHECKMONITORPOWERSTATE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct PFND3DKMT_CHECKMONITORPOWERSTATE {
    value : IntPtr

    __value {
        set {
            if (value is PFND3DKMT_CHECKMONITORPOWERSTATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CHECKMONITORPOWERSTATE>} param0 
     * @returns {NTSTATUS} 
     */
    Call(param0) {
        result := DllCall(this.value, D3DKMT_CHECKMONITORPOWERSTATE.Ptr, param0, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PFND3DKMT_CHECKMONITORPOWERSTATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFND3DKMT_CHECKMONITORPOWERSTATE {
        /**
         * Creates a PFND3DKMT_CHECKMONITORPOWERSTATE pointer that invokes the given AHK function when called.
         * @param {Func(D3DKMT_CHECKMONITORPOWERSTATE) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [D3DKMT_CHECKMONITORPOWERSTATE.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
