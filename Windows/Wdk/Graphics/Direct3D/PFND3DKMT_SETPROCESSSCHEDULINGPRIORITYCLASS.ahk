#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_SCHEDULINGPRIORITYCLASS.ahk" { D3DKMT_SCHEDULINGPRIORITYCLASS }
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct PFND3DKMT_SETPROCESSSCHEDULINGPRIORITYCLASS {
    value : IntPtr

    __value {
        set {
            if (value is PFND3DKMT_SETPROCESSSCHEDULINGPRIORITYCLASS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} param0 
     * @param {D3DKMT_SCHEDULINGPRIORITYCLASS} param1 
     * @returns {NTSTATUS} 
     */
    Call(param0, param1) {
        result := DllCall(this.value, HANDLE, param0, D3DKMT_SCHEDULINGPRIORITYCLASS, param1, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PFND3DKMT_SETPROCESSSCHEDULINGPRIORITYCLASS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFND3DKMT_SETPROCESSSCHEDULINGPRIORITYCLASS {
        /**
         * Creates a PFND3DKMT_SETPROCESSSCHEDULINGPRIORITYCLASS pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, D3DKMT_SCHEDULINGPRIORITYCLASS) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, D3DKMT_SCHEDULINGPRIORITYCLASS, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
