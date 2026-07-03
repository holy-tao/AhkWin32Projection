#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLT_CALLBACK_DATA.ahk" { FLT_CALLBACK_DATA }
#Import ".\FLT_POSTOP_CALLBACK_STATUS.ahk" { FLT_POSTOP_CALLBACK_STATUS }
#Import ".\FLT_RELATED_OBJECTS.ahk" { FLT_RELATED_OBJECTS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_POST_OPERATION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_POST_OPERATION_CALLBACK) {
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
     * @param {Pointer<Void>} CompletionContext 
     * @param {Integer} Flags 
     * @returns {FLT_POSTOP_CALLBACK_STATUS} 
     */
    Call(Data, FltObjects, CompletionContext, Flags) {
        CompletionContextMarshal := CompletionContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, FLT_CALLBACK_DATA.Ptr, Data, FLT_RELATED_OBJECTS.Ptr, FltObjects, CompletionContextMarshal, CompletionContext, UInt32, Flags, FLT_POSTOP_CALLBACK_STATUS)
        return result
    }

    /**
     * A PFLT_POST_OPERATION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_POST_OPERATION_CALLBACK {
        /**
         * Creates a PFLT_POST_OPERATION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(FLT_CALLBACK_DATA, FLT_RELATED_OBJECTS, "ptr", UInt32) => FLT_POSTOP_CALLBACK_STATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FLT_CALLBACK_DATA.Ptr, FLT_RELATED_OBJECTS.Ptr, "ptr", UInt32, FLT_POSTOP_CALLBACK_STATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
