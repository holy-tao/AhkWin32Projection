#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * PENUMDIRTREE_CALLBACK (dbghelp.h) is an application-defined callback function used with the EnumDirTree function. It is called every time a match is found.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-penumdirtree_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset ANSI
 */
export default struct PENUMDIRTREE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PENUMDIRTREE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} FilePath A pointer to a buffer that receives the full path of the file that is found.
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
     * A PENUMDIRTREE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PENUMDIRTREE_CALLBACK {
        /**
         * Creates a PENUMDIRTREE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
