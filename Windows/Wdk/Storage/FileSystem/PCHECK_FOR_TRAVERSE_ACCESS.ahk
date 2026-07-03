#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\SECURITY_SUBJECT_CONTEXT.ahk" { SECURITY_SUBJECT_CONTEXT }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PCHECK_FOR_TRAVERSE_ACCESS {
    value : IntPtr

    __value {
        set {
            if (value is PCHECK_FOR_TRAVERSE_ACCESS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} NotifyContext 
     * @param {Pointer<Void>} TargetContext 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
     * @returns {BOOLEAN} 
     */
    Call(NotifyContext, TargetContext, SubjectContext) {
        NotifyContextMarshal := NotifyContext is VarRef ? "ptr" : "ptr"
        TargetContextMarshal := TargetContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, NotifyContextMarshal, NotifyContext, TargetContextMarshal, TargetContext, SECURITY_SUBJECT_CONTEXT.Ptr, SubjectContext, BOOLEAN)
        return result
    }

    /**
     * A PCHECK_FOR_TRAVERSE_ACCESS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCHECK_FOR_TRAVERSE_ACCESS {
        /**
         * Creates a PCHECK_FOR_TRAVERSE_ACCESS pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", SECURITY_SUBJECT_CONTEXT) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", SECURITY_SUBJECT_CONTEXT.Ptr, BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
