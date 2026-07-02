#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Diagnostics\Debug\EXCEPTION_POINTERS.ahk" { EXCEPTION_POINTERS }

/**
 * @namespace Windows.Win32.System.SystemServices
 * @architecture X64, Arm64
 */
export default struct PEXCEPTION_FILTER {
    value : IntPtr

    __value {
        set {
            if (value is PEXCEPTION_FILTER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<EXCEPTION_POINTERS>} ExceptionPointers 
     * @param {Pointer<Void>} EstablisherFrame 
     * @returns {Integer} 
     */
    Call(ExceptionPointers, EstablisherFrame) {
        EstablisherFrameMarshal := EstablisherFrame is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, EXCEPTION_POINTERS.Ptr, ExceptionPointers, EstablisherFrameMarshal, EstablisherFrame, Int32)
        return result
    }

    /**
     * A PEXCEPTION_FILTER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PEXCEPTION_FILTER {
        /**
         * Creates a PEXCEPTION_FILTER pointer that invokes the given AHK function when called.
         * @param {Func(EXCEPTION_POINTERS, "ptr") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [EXCEPTION_POINTERS.Ptr, "ptr", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
