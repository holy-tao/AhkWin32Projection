#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\PSTR.ahk" { PSTR }
#Import "..\Foundation\BOOL.ahk" { BOOL }

/**
 * An application-defined callback function that processes enumerated language group locale information provided by the EnumLanguageGroupLocales function. (ANSI)
 * @remarks
 * An <b>EnumLanguageGroupLocalesProc</b> function can carry out any desired task. The application registers this function by passing its address to the <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-enumlanguagegrouplocalesa">EnumLanguageGroupLocales</a> function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winnls.h header defines LANGGROUPLOCALE_ENUMPROC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winnls/nc-winnls-langgrouplocale_enumproca
 * @namespace Windows.Win32.Globalization
 * @charset ANSI
 */
export default struct LANGGROUPLOCALE_ENUMPROCA {
    value : IntPtr

    __value {
        set {
            if (value is LANGGROUPLOCALE_ENUMPROCA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {PSTR} param2 
     * @param {Pointer} param3 
     * @returns {BOOL} Returns <b>TRUE</b> to continue enumeration or <b>FALSE</b> otherwise.
     */
    Call(param0, param1, param2, param3) {
        param2 := param2 is String ? StrPtr(param2) : param2

        result := DllCall(this.value, UInt32, param0, UInt32, param1, "ptr", param2, IntPtr, param3, BOOL)
        return result
    }

    /**
     * A LANGGROUPLOCALE_ENUMPROCA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LANGGROUPLOCALE_ENUMPROCA {
        /**
         * Creates a LANGGROUPLOCALE_ENUMPROCA pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, PSTR, IntPtr) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, PSTR, IntPtr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
