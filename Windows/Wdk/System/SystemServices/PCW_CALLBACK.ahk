#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PCW_CALLBACK_INFORMATION.ahk" { PCW_CALLBACK_INFORMATION }
#Import ".\PCW_CALLBACK_TYPE.ahk" { PCW_CALLBACK_TYPE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCW_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PCW_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PCW_CALLBACK_TYPE} Type 
     * @param {Pointer<PCW_CALLBACK_INFORMATION>} Info 
     * @param {Pointer<Void>} _Context 
     * @returns {NTSTATUS} 
     */
    Call(Type, Info, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, PCW_CALLBACK_TYPE, Type, PCW_CALLBACK_INFORMATION.Ptr, Info, _ContextMarshal, _Context, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PCW_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCW_CALLBACK {
        /**
         * Creates a PCW_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PCW_CALLBACK_TYPE, PCW_CALLBACK_INFORMATION, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PCW_CALLBACK_TYPE, PCW_CALLBACK_INFORMATION.Ptr, "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
