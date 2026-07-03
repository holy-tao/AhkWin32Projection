#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Win32\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PGET_LOCATION_STRING {
    value : IntPtr

    __value {
        set {
            if (value is PGET_LOCATION_STRING) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<PWSTR>} LocationStrings 
     * @returns {NTSTATUS} 
     */
    Call(_Context, LocationStrings) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        LocationStringsMarshal := LocationStrings is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, LocationStringsMarshal, LocationStrings, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PGET_LOCATION_STRING that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_LOCATION_STRING {
        /**
         * Creates a PGET_LOCATION_STRING pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PWSTR) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PWSTR.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
