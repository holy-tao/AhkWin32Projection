#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * PFIND_DEBUG_FILE_CALLBACKW (Unicode) is an application-defined callback function used with the FindDebugInfoFileEx function.
 * @remarks
 * One way to verify the symbol file is to compare its timestamp to the timestamp in the image. To retrieve the timestamp of the image, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-gettimestampforloadedlibrary">GetTimestampForLoadedLibrary</a> function. To retrieve the timestamp of the symbol file, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetmoduleinfo">SymGetModuleInfo64</a> function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The dbghelp.h header defines PFIND_DEBUG_FILE_CALLBACK as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-pfind_debug_file_callbackw
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset Unicode
 */
export default struct PFIND_DEBUG_FILE_CALLBACKW {
    value : IntPtr

    __value {
        set {
            if (value is PFIND_DEBUG_FILE_CALLBACKW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} FileHandle A handle to the symbol file.
     * @param {PWSTR} FileName The name of the symbol file.
     * @param {Pointer<Void>} CallerData Optional user-defined data. This parameter can be <b>NULL</b>.
     * @returns {BOOL} If the symbol file is valid, return <b>TRUE</b>. Otherwise, return <b>FALSE</b>.
     */
    Call(FileHandle, FileName, CallerData) {
        FileName := FileName is String ? StrPtr(FileName) : FileName

        CallerDataMarshal := CallerData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HANDLE, FileHandle, "ptr", FileName, CallerDataMarshal, CallerData, BOOL)
        return result
    }

    /**
     * A PFIND_DEBUG_FILE_CALLBACKW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFIND_DEBUG_FILE_CALLBACKW {
        /**
         * Creates a PFIND_DEBUG_FILE_CALLBACKW pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, PWSTR, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, PWSTR, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
