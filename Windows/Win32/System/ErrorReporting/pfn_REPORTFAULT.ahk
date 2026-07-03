#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Diagnostics\Debug\EXCEPTION_POINTERS.ahk" { EXCEPTION_POINTERS }
#Import ".\EFaultRepRetVal.ahk" { EFaultRepRetVal }

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct pfn_REPORTFAULT {
    value : IntPtr

    __value {
        set {
            if (value is pfn_REPORTFAULT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<EXCEPTION_POINTERS>} param0 
     * @param {Integer} param1 
     * @returns {EFaultRepRetVal} 
     */
    Call(param0, param1) {
        result := DllCall(this.value, EXCEPTION_POINTERS.Ptr, param0, UInt32, param1, EFaultRepRetVal)
        return result
    }

    /**
     * A pfn_REPORTFAULT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pfn_REPORTFAULT {
        /**
         * Creates a pfn_REPORTFAULT pointer that invokes the given AHK function when called.
         * @param {Func(EXCEPTION_POINTERS, UInt32) => EFaultRepRetVal} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [EXCEPTION_POINTERS.Ptr, UInt32, EFaultRepRetVal])
        }

        __Delete() => CallbackFree(this.value)
    }
}
