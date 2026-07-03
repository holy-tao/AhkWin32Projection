#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLT_CALLBACK_DATA.ahk" { FLT_CALLBACK_DATA }
#Import ".\FLT_PREOP_CALLBACK_STATUS.ahk" { FLT_PREOP_CALLBACK_STATUS }
#Import ".\FLT_RELATED_OBJECTS.ahk" { FLT_RELATED_OBJECTS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_PRE_OPERATION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_PRE_OPERATION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @param {Pointer<FLT_RELATED_OBJECTS>} FltObjects 
     * @param {Pointer<Pointer<Void>>} CompletionContext 
     * @returns {FLT_PREOP_CALLBACK_STATUS} 
     */
    Call(Data, FltObjects, CompletionContext) {
        CompletionContextMarshal := CompletionContext is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, FLT_CALLBACK_DATA.Ptr, Data, FLT_RELATED_OBJECTS.Ptr, FltObjects, CompletionContextMarshal, CompletionContext, FLT_PREOP_CALLBACK_STATUS)
        return result
    }

    /**
     * A PFLT_PRE_OPERATION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_PRE_OPERATION_CALLBACK {
        /**
         * Creates a PFLT_PRE_OPERATION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(FLT_CALLBACK_DATA, FLT_RELATED_OBJECTS, "ptr*") => FLT_PREOP_CALLBACK_STATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FLT_CALLBACK_DATA.Ptr, FLT_RELATED_OBJECTS.Ptr, "ptr*", FLT_PREOP_CALLBACK_STATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
