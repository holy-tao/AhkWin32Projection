#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PHALMCAINTERFACEREADREGISTER {
    value : IntPtr

    __value {
        set {
            if (value is PHALMCAINTERFACEREADREGISTER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} BankNumber 
     * @param {Pointer<Void>} Exception 
     * @returns {NTSTATUS} 
     */
    Call(BankNumber, Exception) {
        ExceptionMarshal := Exception is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, Int8, BankNumber, ExceptionMarshal, Exception, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PHALMCAINTERFACEREADREGISTER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PHALMCAINTERFACEREADREGISTER {
        /**
         * Creates a PHALMCAINTERFACEREADREGISTER pointer that invokes the given AHK function when called.
         * @param {Func(Int8, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int8, "ptr", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
