#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_BUDGETCHANGENOTIFICATION.ahk" { D3DKMT_BUDGETCHANGENOTIFICATION }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct PFND3DKMT_BUDGETCHANGENOTIFICATIONCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFND3DKMT_BUDGETCHANGENOTIFICATIONCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<D3DKMT_BUDGETCHANGENOTIFICATION>} param0 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0) {
        DllCall(this.value, D3DKMT_BUDGETCHANGENOTIFICATION.Ptr, param0)
    }

    /**
     * A PFND3DKMT_BUDGETCHANGENOTIFICATIONCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFND3DKMT_BUDGETCHANGENOTIFICATIONCALLBACK {
        /**
         * Creates a PFND3DKMT_BUDGETCHANGENOTIFICATIONCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(D3DKMT_BUDGETCHANGENOTIFICATION) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [D3DKMT_BUDGETCHANGENOTIFICATION.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
