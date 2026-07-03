#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\ADDRESS64.ahk" { ADDRESS64 }

/**
 * PTRANSLATE_ADDRESS_ROUTINE64 (dbghelp.h) is an application-defined callback function used with the StackWalk64 function.
 * @remarks
 * This callback function supersedes the <i>PTRANSLATE_ADDRESS_ROUTINE</i> callback function.  <i>PTRANSLATE_ADDRESS_ROUTINE</i> is defined as follows in Dbghelp.h.
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-ptranslate_address_routine64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PTRANSLATE_ADDRESS_ROUTINE64 {
    value : IntPtr

    __value {
        set {
            if (value is PTRANSLATE_ADDRESS_ROUTINE64) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hProcess A handle to the process for which the stack trace is generated.
     * @param {HANDLE} hThread A handle to the thread for which the stack trace is generated.
     * @param {Pointer<ADDRESS64>} lpaddr An address to be translated.
     * @returns {Integer} The function returns the translated address.
     */
    Call(hProcess, hThread, lpaddr) {
        result := DllCall(this.value, HANDLE, hProcess, HANDLE, hThread, ADDRESS64.Ptr, lpaddr, Int64)
        return result
    }

    /**
     * A PTRANSLATE_ADDRESS_ROUTINE64 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PTRANSLATE_ADDRESS_ROUTINE64 {
        /**
         * Creates a PTRANSLATE_ADDRESS_ROUTINE64 pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, ADDRESS64) => Int64} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, ADDRESS64.Ptr, Int64])
        }

        __Delete() => CallbackFree(this.value)
    }
}
