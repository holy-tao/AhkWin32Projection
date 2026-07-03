#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PMM_GET_SYSTEM_ROUTINE_ADDRESS_EX {
    value : IntPtr

    __value {
        set {
            if (value is PMM_GET_SYSTEM_ROUTINE_ADDRESS_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} ModuleName 
     * @param {PSTR} FunctionName 
     * @returns {Pointer<Void>} 
     */
    Call(ModuleName, FunctionName) {
        FunctionName := FunctionName is String ? StrPtr(FunctionName) : FunctionName

        result := DllCall(this.value, UNICODE_STRING.Ptr, ModuleName, "ptr", FunctionName, IntPtr)
        return result
    }

    /**
     * A PMM_GET_SYSTEM_ROUTINE_ADDRESS_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMM_GET_SYSTEM_ROUTINE_ADDRESS_EX {
        /**
         * Creates a PMM_GET_SYSTEM_ROUTINE_ADDRESS_EX pointer that invokes the given AHK function when called.
         * @param {Func(UNICODE_STRING, PSTR) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UNICODE_STRING.Ptr, PSTR, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
