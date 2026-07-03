#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\ENUM_PAGE_FILE_INFORMATION.ahk" { ENUM_PAGE_FILE_INFORMATION }

/**
 * An application-defined callback function used with the EnumPageFiles function. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The psapi.h header defines PENUM_PAGE_FILE_CALLBACK as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/psapi/nc-psapi-penum_page_file_callbacka
 * @namespace Windows.Win32.System.ProcessStatus
 * @charset ANSI
 */
export default struct PENUM_PAGE_FILE_CALLBACKA {
    value : IntPtr

    __value {
        set {
            if (value is PENUM_PAGE_FILE_CALLBACKA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pContext The user-defined data passed from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-enumpagefilesa">EnumPageFiles</a>.
     * @param {Pointer<ENUM_PAGE_FILE_INFORMATION>} pPageFileInfo A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-enum_page_file_information">ENUM_PAGE_FILE_INFORMATION</a> structure.
     * @param {PSTR} lpFilename The name of the pagefile.
     * @returns {BOOL} To continue enumeration, the callback function must return TRUE.
     * 
     * To stop enumeration, the callback function must return FALSE.
     */
    Call(pContext, pPageFileInfo, lpFilename) {
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pContextMarshal, pContext, ENUM_PAGE_FILE_INFORMATION.Ptr, pPageFileInfo, "ptr", lpFilename, BOOL)
        return result
    }

    /**
     * A PENUM_PAGE_FILE_CALLBACKA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PENUM_PAGE_FILE_CALLBACKA {
        /**
         * Creates a PENUM_PAGE_FILE_CALLBACKA pointer that invokes the given AHK function when called.
         * @param {Func("ptr", ENUM_PAGE_FILE_INFORMATION, PSTR) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", ENUM_PAGE_FILE_INFORMATION.Ptr, PSTR, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
