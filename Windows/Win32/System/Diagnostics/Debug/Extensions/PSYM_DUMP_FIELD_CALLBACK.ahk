#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FIELD_INFO.ahk" { FIELD_INFO }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PSYM_DUMP_FIELD_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PSYM_DUMP_FIELD_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FIELD_INFO>} pField 
     * @param {Pointer<Void>} UserContext 
     * @returns {Integer} 
     */
    Call(pField, UserContext) {
        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, FIELD_INFO.Ptr, pField, UserContextMarshal, UserContext, UInt32)
        return result
    }

    /**
     * A PSYM_DUMP_FIELD_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSYM_DUMP_FIELD_CALLBACK {
        /**
         * Creates a PSYM_DUMP_FIELD_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(FIELD_INFO, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FIELD_INFO.Ptr, "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
