#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLT_CALLBACK_DATA.ahk" { FLT_CALLBACK_DATA }
#Import ".\PFLT_CONTEXT.ahk" { PFLT_CONTEXT }
#Import ".\PFLT_INSTANCE.ahk" { PFLT_INSTANCE }
#Import "..\..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_SECTION_CONFLICT_NOTIFICATION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_SECTION_CONFLICT_NOTIFICATION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {PFLT_CONTEXT} SectionContext 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @returns {NTSTATUS} 
     */
    Call(Instance, SectionContext, Data) {
        result := DllCall(this.value, PFLT_INSTANCE, Instance, PFLT_CONTEXT, SectionContext, FLT_CALLBACK_DATA.Ptr, Data, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PFLT_SECTION_CONFLICT_NOTIFICATION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_SECTION_CONFLICT_NOTIFICATION_CALLBACK {
        /**
         * Creates a PFLT_SECTION_CONFLICT_NOTIFICATION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PFLT_INSTANCE, PFLT_CONTEXT, FLT_CALLBACK_DATA) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PFLT_INSTANCE, PFLT_CONTEXT, FLT_CALLBACK_DATA.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
