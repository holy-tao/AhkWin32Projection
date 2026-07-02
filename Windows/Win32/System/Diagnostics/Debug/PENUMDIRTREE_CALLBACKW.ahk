#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * PENUMDIRTREE_CALLBACKW (Unicode) is an application-defined callback function used with the EnumDirTree function. It is called every time a match is found.
 * @remarks
 * > [!NOTE]
 * > The dbghelp.h header defines PENUMDIRTREE_CALLBACK as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-penumdirtree_callbackw
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset Unicode
 */
export default struct PENUMDIRTREE_CALLBACKW {
    value : IntPtr

    __value {
        set {
            if (value is PENUMDIRTREE_CALLBACKW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} FilePath A pointer to a buffer that receives the full path of the file that is found.
     * @param {Pointer<Void>} CallerData A user-defined value specified in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-enumdirtree">EnumDirTree</a>, or <b>NULL</b>. Typically, this parameter is used by an application to pass a pointer to a data structure that enables the callback function to establish some context.
     * @returns {BOOL} To continue enumeration, the callback function must return <b>FALSE</b>.
     * 
     * To stop enumeration, the callback function must return <b>TRUE</b>.
     */
    Call(FilePath, CallerData) {
        FilePath := FilePath is String ? StrPtr(FilePath) : FilePath

        CallerDataMarshal := CallerData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", FilePath, CallerDataMarshal, CallerData, BOOL)
        return result
    }

    /**
     * A PENUMDIRTREE_CALLBACKW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PENUMDIRTREE_CALLBACKW {
        /**
         * Creates a PENUMDIRTREE_CALLBACKW pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
