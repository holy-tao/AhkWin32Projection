#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct TDI_REGISTER_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is TDI_REGISTER_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} DeviceName 
     * @param {Pointer<HANDLE>} TdiHandle 
     * @returns {NTSTATUS} 
     */
    Call(DeviceName, TdiHandle) {
        result := DllCall(this.value, UNICODE_STRING.Ptr, DeviceName, HANDLE.Ptr, TdiHandle, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A TDI_REGISTER_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends TDI_REGISTER_CALLBACK {
        /**
         * Creates a TDI_REGISTER_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UNICODE_STRING, HANDLE) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UNICODE_STRING.Ptr, HANDLE.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
