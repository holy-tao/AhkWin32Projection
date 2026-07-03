#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Foundation\PSTR.ahk" { PSTR }

/**
 * An application-defined callback function that processes enumerated user interface language information provided by the EnumUILanguages function. (ANSI)
 * @remarks
 * An <b>EnumUILanguagesProc</b> function can carry out any task. The application registers this function by passing its address to the <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-enumuilanguagesa">EnumUILanguages</a> function.
 * 
 * If MUI_LANGUAGE_ID was specified in the call to <b>EnumUILanguages</b>, the language strings passed to this function will be hexadecimal language 
 * 
 * identifiers that do not include the leading 0x, and will be 4 characters in length. For example, en-US will 
 * 
 * be passed as "0409" and en as "0009".
 * 
 * <h3><a id="C__Signature"></a><a id="c__signature"></a><a id="C__SIGNATURE"></a>C# Signature</h3>
 * 
 * ```cpp
 * delegate System.Boolean EnumUILanguagesProc(
 *             System.IntPtr lpUILanguageString,
 *             System.IntPtr lParam
 *             );
 * 
 * ```
 * 
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winnls.h header defines UILANGUAGE_ENUMPROC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winnls/nc-winnls-uilanguage_enumproca
 * @namespace Windows.Win32.Globalization
 * @charset ANSI
 */
export default struct UILANGUAGE_ENUMPROCA {
    value : IntPtr

    __value {
        set {
            if (value is UILANGUAGE_ENUMPROCA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} param0 
     * @param {Pointer} param1 
     * @returns {BOOL} Returns <b>TRUE</b> to continue enumeration or <b>FALSE</b> otherwise.
     */
    Call(param0, param1) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall(this.value, "ptr", param0, IntPtr, param1, BOOL)
        return result
    }

    /**
     * A UILANGUAGE_ENUMPROCA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UILANGUAGE_ENUMPROCA {
        /**
         * Creates a UILANGUAGE_ENUMPROCA pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, IntPtr) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, IntPtr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
