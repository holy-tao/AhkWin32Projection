#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\HIMC.ahk" { HIMC }

/**
 * IMCENUMPROC (immdev.h) is an application-defined callback function that processes input contexts provided by the ImmEnumInputContext function.
 * @remarks
 * An application must register this function by passing its address to the <a href="https://docs.microsoft.com/windows/win32/api/imm/nf-imm-immenuminputcontext">ImmEnumInputContext</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nc-immdev-imcenumproc
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMCENUMPROC {
    value : IntPtr

    __value {
        set {
            if (value is IMCENUMPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HIMC} param0 Handle to the input context.
     * @param {LPARAM} param1 Application-supplied data.
     * @returns {BOOL} Returns a nonzero value to continue enumeration, or 0 to stop enumeration.
     */
    Call(param0, param1) {
        result := DllCall(this.value, HIMC, param0, LPARAM, param1, BOOL)
        return result
    }

    /**
     * A IMCENUMPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IMCENUMPROC {
        /**
         * Creates a IMCENUMPROC pointer that invokes the given AHK function when called.
         * @param {Func(HIMC, LPARAM) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HIMC, LPARAM, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
