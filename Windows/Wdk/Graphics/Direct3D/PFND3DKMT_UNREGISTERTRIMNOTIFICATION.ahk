#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_UNREGISTERTRIMNOTIFICATION.ahk" { D3DKMT_UNREGISTERTRIMNOTIFICATION }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct PFND3DKMT_UNREGISTERTRIMNOTIFICATION {
    value : IntPtr

    __value {
        set {
            if (value is PFND3DKMT_UNREGISTERTRIMNOTIFICATION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<D3DKMT_UNREGISTERTRIMNOTIFICATION>} param0 
     * @returns {NTSTATUS} 
     */
    Call(param0) {
        result := DllCall(this.value, D3DKMT_UNREGISTERTRIMNOTIFICATION.Ptr, param0, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PFND3DKMT_UNREGISTERTRIMNOTIFICATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFND3DKMT_UNREGISTERTRIMNOTIFICATION {
        /**
         * Creates a PFND3DKMT_UNREGISTERTRIMNOTIFICATION pointer that invokes the given AHK function when called.
         * @param {Func(D3DKMT_UNREGISTERTRIMNOTIFICATION) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [D3DKMT_UNREGISTERTRIMNOTIFICATION.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
