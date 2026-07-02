#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DDEnumCallback function is an application-defined callback function for the DirectDrawEnumerate function. (ANSI)
 * @remarks
 * You can use the LPDDENUMCALLBACK data type to declare a variable that can contain a pointer to this callback function.
 * 
 * If UNICODE is defined, the string values are returned as type LPWSTR, rather than LPSTR.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ddraw.h header defines LPDDENUMCALLBACK as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/nc-ddraw-lpddenumcallbacka
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @charset ANSI
 */
export default struct LPDDENUMCALLBACKA {
    value : IntPtr

    __value {
        set {
            if (value is LPDDENUMCALLBACKA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 A pointer to the unique identifier of the DirectDraw object.
     * @param {PSTR} param1 Address of a string that contains the driver name.
     * @param {PSTR} param2 Address of a string that contains the driver description.
     * @param {Pointer<Void>} param3 A pointer to an application-defined structure to be passed to the callback function each time the function is called.
     * @returns {BOOL} The callback function returns nonzero to continue the enumeration.
     * 
     * It returns zero to stop the enumeration.
     */
    Call(param0, param1, param2, param3) {
        param1 := param1 is String ? StrPtr(param1) : param1
        param2 := param2 is String ? StrPtr(param2) : param2

        param3Marshal := param3 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, Guid.Ptr, param0, "ptr", param1, "ptr", param2, param3Marshal, param3, BOOL)
        return result
    }

    /**
     * A LPDDENUMCALLBACKA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDENUMCALLBACKA {
        /**
         * Creates a LPDDENUMCALLBACKA pointer that invokes the given AHK function when called.
         * @param {Func(Guid, PSTR, PSTR, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, PSTR, PSTR, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
