#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\INIT_ONCE.ahk" { INIT_ONCE }

/**
 * An application-defined callback function. Specify a pointer to this function when calling the InitOnceExecuteOnce function.
 * @remarks
 * This function can create a synchronization object and return it in the <i>lpContext</i> parameter.
 * 
 * To compile an application that uses this function, define <b>_WIN32_WINNT</b> as 0x0600 or later. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * @see https://learn.microsoft.com/windows/win32/api/synchapi/nc-synchapi-pinit_once_fn
 * @namespace Windows.Win32.System.Threading
 */
export default struct PINIT_ONCE_FN {
    value : IntPtr

    __value {
        set {
            if (value is PINIT_ONCE_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<INIT_ONCE>} InitOnce A pointer to the one-time initialization structure.
     * @param {Pointer<Void>} Parameter An optional parameter that was passed to the callback function.
     * @param {Pointer<Pointer<Void>>} _Context The data to be stored with the one-time initialization structure. If  <i>Context</i>  references a value, the low-order <b>INIT_ONCE_CTX_RESERVED_BITS</b> of the value must be zero. If  <i>Context</i>  points to a data structure, the data structure must be <b>DWORD</b>-aligned. <i>Context</i> must not be a code pointer on Arm32, because Arm32 code pointers always have the least significant bit set, see the <a href="https://docs.microsoft.com/cpp/build/overview-of-arm-abi-conventions?view=msvc-170#instruction-set">Arm32 ABI</a> for details.
     * @returns {BOOL} If the function returns <b>TRUE</b>, the block is marked as initialized.
     * 
     * If the function returns <b>FALSE</b>, the block is not marked as initialized and the call to <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-initonceexecuteonce">InitOnceExecuteOnce</a> fails. To communicate additional error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> before returning <b>FALSE</b>.
     */
    Call(InitOnce, Parameter, _Context) {
        ParameterMarshal := Parameter is VarRef ? "ptr" : "ptr"
        _ContextMarshal := _Context is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, INIT_ONCE.Ptr, InitOnce, ParameterMarshal, Parameter, _ContextMarshal, _Context, BOOL)
        return result
    }

    /**
     * A PINIT_ONCE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PINIT_ONCE_FN {
        /**
         * Creates a PINIT_ONCE_FN pointer that invokes the given AHK function when called.
         * @param {Func(INIT_ONCE, "ptr", "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [INIT_ONCE.Ptr, "ptr", "ptr*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
