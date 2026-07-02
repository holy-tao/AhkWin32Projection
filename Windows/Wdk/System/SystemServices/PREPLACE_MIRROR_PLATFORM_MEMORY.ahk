#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PREPLACE_MIRROR_PLATFORM_MEMORY {
    value : IntPtr

    __value {
        set {
            if (value is PREPLACE_MIRROR_PLATFORM_MEMORY) {
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
     * @returns {NTSTATUS} 
     */
    Call(_Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PREPLACE_MIRROR_PLATFORM_MEMORY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PREPLACE_MIRROR_PLATFORM_MEMORY {
        /**
         * Creates a PREPLACE_MIRROR_PLATFORM_MEMORY pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
