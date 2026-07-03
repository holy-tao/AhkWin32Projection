#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The EnumICMProfilesProcCallback callback is an application-defined callback function that processes color profile data from EnumICMProfiles . (ANSI)
 * @remarks
 * > [!NOTE]
 * > The wingdi.h header defines ICMENUMPROC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/nc-wingdi-icmenumproca
 * @namespace Windows.Win32.UI.ColorSystem
 * @charset ANSI
 */
export default struct ICMENUMPROCA {
    value : IntPtr

    __value {
        set {
            if (value is ICMENUMPROCA) {
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
     * @param {LPARAM} param1 
     * @returns {Integer} This function must return a positive value to continue enumeration, or zero to stop enumeration. It may not return a negative value.
     */
    Call(param0, param1) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall(this.value, "ptr", param0, LPARAM, param1, Int32)
        return result
    }

    /**
     * A ICMENUMPROCA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ICMENUMPROCA {
        /**
         * Creates a ICMENUMPROCA pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, LPARAM) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, LPARAM, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
