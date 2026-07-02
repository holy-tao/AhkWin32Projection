#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Diagnostics\Debug\EXCEPTION_RECORD.ahk" { EXCEPTION_RECORD }
#Import ".\EXCEPTION_DISPOSITION.ahk" { EXCEPTION_DISPOSITION }
#Import "..\Diagnostics\Debug\CONTEXT.ahk" { CONTEXT }

/**
 * @namespace Windows.Win32.System.Kernel
 */
export default struct EXCEPTION_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is EXCEPTION_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<EXCEPTION_RECORD>} ExceptionRecord 
     * @param {Pointer<Void>} EstablisherFrame 
     * @param {Pointer<CONTEXT>} ContextRecord 
     * @param {Pointer<Void>} DispatcherContext 
     * @returns {EXCEPTION_DISPOSITION} 
     */
    Call(ExceptionRecord, EstablisherFrame, ContextRecord, DispatcherContext) {
        EstablisherFrameMarshal := EstablisherFrame is VarRef ? "ptr" : "ptr"
        DispatcherContextMarshal := DispatcherContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, EXCEPTION_RECORD.Ptr, ExceptionRecord, EstablisherFrameMarshal, EstablisherFrame, CONTEXT.Ptr, ContextRecord, DispatcherContextMarshal, DispatcherContext, EXCEPTION_DISPOSITION)
        return result
    }

    /**
     * A EXCEPTION_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXCEPTION_ROUTINE {
        /**
         * Creates a EXCEPTION_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(EXCEPTION_RECORD, "ptr", CONTEXT, "ptr") => EXCEPTION_DISPOSITION} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [EXCEPTION_RECORD.Ptr, "ptr", CONTEXT.Ptr, "ptr", EXCEPTION_DISPOSITION])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
