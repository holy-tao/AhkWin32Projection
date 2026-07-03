#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * An application-defined callback function that processes enumerated locale information provided by the EnumSystemLocalesEx function.
 * @remarks
 * An <b>EnumLocalesProcEx</b> function can carry out any desired task. The application registers this function by passing its address to the <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-enumsystemlocalesex">EnumSystemLocalesEx</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winnls/nc-winnls-locale_enumprocex
 * @namespace Windows.Win32.Globalization
 */
export default struct LOCALE_ENUMPROCEX {
    value : IntPtr

    __value {
        set {
            if (value is LOCALE_ENUMPROCEX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} param0 Pointer to a buffer containing a null-terminated [locale name](/windows/win32/intl/locale-names) string.
     * @param {Integer} param1 Flags defining locale information. Values for this parameter can include a binary OR of flags, but some flag combinations never occur. If the application specifies[LOCALE_WINDOWS](/windows/win32/intl/locale-windows) or [LOCALE_ALTERNATE_SORTS](/windows/win32/intl/locale-alternate-sorts), it can also specify [LOCALE_REPLACEMENT](/windows/win32/intl/locale-replacement) so that the [EnumSystemLocalesEx](./nf-winnls-enumsystemlocalesex.md) function can test to see if the locale is a replacement.
     * 
     * - [LOCALE_ALL](/windows/win32/intl/locale-all)
     * - [LOCALE_ALTERNATE_SORTS](/windows/win32/intl/locale-alternate-sorts); for more information, see [EnumSystemLocalesEx](./nf-winnls-enumsystemlocalesex.md)
     * - [LOCALE_NEUTRALDATA](/windows/win32/intl/locale-neutraldata)
     * - [LOCALE_REPLACEMENT](/windows/win32/intl/locale-replacement) This constant is not a valid input to the *dwFlags* parameter of <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-enumsystemlocalesex">EnumSystemLocalesEx</a>. To enumerate replacement locales, the application should call this function with the *Arg2* parameter specified as **LOCALE_WINDOWS** or **LOCALE_ALL**, then check for this constant in the callback function.
     * - [LOCALE_SUPPLEMENTAL](/windows/win32/intl/locale-supplemental)
     * - [LOCALE_WINDOWS](/windows/win32/intl/locale-windows)
     * - [LOCALE_NEUTRALDATA](/windows/win32/intl/locale-neutraldata)
     * - [LOCALE_SPECIFICDATA](/windows/win32/intl/locale-specificdata)
     * @param {LPARAM} param2 An application-provided input parameter of <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-enumsystemlocalesex">EnumSystemLocalesEx</a>. This value is especially useful for multi-threaded applications, since it can be used to pass thread-specific data to this callback function.
     * @returns {BOOL} Returns <b>TRUE</b> to continue enumeration or <b>FALSE</b> otherwise.
     */
    Call(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall(this.value, "ptr", param0, UInt32, param1, LPARAM, param2, BOOL)
        return result
    }

    /**
     * A LOCALE_ENUMPROCEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LOCALE_ENUMPROCEX {
        /**
         * Creates a LOCALE_ENUMPROCEX pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, LPARAM) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, LPARAM, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
