#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * REGISTERWORDENUMPROCW (Unicode) is an application-defined callback function used with the ImmEnumRegisterWord function. (registerwordenumprocw)
 * @remarks
 * An application must register this function by passing its address to the <a href="https://docs.microsoft.com/windows/win32/api/imm/nf-imm-immenumregisterworda">ImmEnumRegisterWord</a> function.
 * 
 * > [!NOTE]
 * > The immdev.h header defines REGISTERWORDENUMPROC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nc-immdev-registerwordenumprocw
 * @namespace Windows.Win32.UI.Input.Ime
 * @charset Unicode
 */
export default struct REGISTERWORDENUMPROCW {
    value : IntPtr

    __value {
        set {
            if (value is REGISTERWORDENUMPROCW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpszReading Pointer to a null-terminated string specifying the matched reading string.
     * @param {Integer} param1 The style of the register string.
     * @param {PWSTR} lpszString Pointer to a null-terminated string specifying the matched register string.
     * @param {Pointer<Void>} param3 Application-supplied data.
     * @returns {Integer} Returns a nonzero value to continue enumeration, or 0 to stop enumeration.
     */
    Call(lpszReading, param1, lpszString, param3) {
        lpszReading := lpszReading is String ? StrPtr(lpszReading) : lpszReading
        lpszString := lpszString is String ? StrPtr(lpszString) : lpszString

        param3Marshal := param3 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", lpszReading, UInt32, param1, "ptr", lpszString, param3Marshal, param3, Int32)
        return result
    }

    /**
     * A REGISTERWORDENUMPROCW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends REGISTERWORDENUMPROCW {
        /**
         * Creates a REGISTERWORDENUMPROCW pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, PWSTR, "ptr") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, PWSTR, "ptr", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
