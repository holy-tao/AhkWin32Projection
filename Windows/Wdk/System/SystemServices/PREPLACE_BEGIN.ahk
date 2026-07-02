#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PNP_REPLACE_PARAMETERS.ahk" { PNP_REPLACE_PARAMETERS }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PREPLACE_BEGIN {
    value : IntPtr

    __value {
        set {
            if (value is PREPLACE_BEGIN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<PNP_REPLACE_PARAMETERS>} Parameters 
     * @param {Pointer<Pointer<Void>>} _Context 
     * @returns {NTSTATUS} 
     */
    Call(Parameters, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, PNP_REPLACE_PARAMETERS.Ptr, Parameters, _ContextMarshal, _Context, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PREPLACE_BEGIN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PREPLACE_BEGIN {
        /**
         * Creates a PREPLACE_BEGIN pointer that invokes the given AHK function when called.
         * @param {Func(PNP_REPLACE_PARAMETERS, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PNP_REPLACE_PARAMETERS.Ptr, "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
