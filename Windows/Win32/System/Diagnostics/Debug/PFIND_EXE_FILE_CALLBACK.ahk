#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * PFIND_EXE_FILE_CALLBACK (dbghelp.h) is an application-defined callback function used with the FindExecutableImageEx function.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-pfind_exe_file_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset ANSI
 */
export default struct PFIND_EXE_FILE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFIND_EXE_FILE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} FileHandle A handle to the executable file.
     * @param {PSTR} FileName The name of the executable file.
     * @param {Pointer<Void>} CallerData Optional user-defined data. This parameter can be <b>NULL</b>.
     * @returns {BOOL} If the executable file is valid, return <b>TRUE</b>. Otherwise, return <b>FALSE</b>.
     */
    Call(FileHandle, FileName, CallerData) {
        FileName := FileName is String ? StrPtr(FileName) : FileName

        CallerDataMarshal := CallerData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HANDLE, FileHandle, "ptr", FileName, CallerDataMarshal, CallerData, BOOL)
        return result
    }

    /**
     * A PFIND_EXE_FILE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFIND_EXE_FILE_CALLBACK {
        /**
         * Creates a PFIND_EXE_FILE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, PSTR, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, PSTR, "ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
