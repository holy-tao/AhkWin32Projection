#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\MDL.ahk" { MDL }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PMM_ROTATE_COPY_CALLBACK_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is PMM_ROTATE_COPY_CALLBACK_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<MDL>} DestinationMdl 
     * @param {Pointer<MDL>} SourceMdl 
     * @param {Pointer<Void>} _Context 
     * @returns {NTSTATUS} 
     */
    Call(DestinationMdl, SourceMdl, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, MDL.Ptr, DestinationMdl, MDL.Ptr, SourceMdl, _ContextMarshal, _Context, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PMM_ROTATE_COPY_CALLBACK_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMM_ROTATE_COPY_CALLBACK_FUNCTION {
        /**
         * Creates a PMM_ROTATE_COPY_CALLBACK_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func(MDL, MDL, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [MDL.Ptr, MDL.Ptr, "ptr", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
