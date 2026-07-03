#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Callback function that gets called for each data source in response to a call to WofEnumEntries.
 * @see https://learn.microsoft.com/windows/win32/api/wofapi/nc-wofapi-wofenumentryproc
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct WofEnumEntryProc {
    value : IntPtr

    __value {
        set {
            if (value is WofEnumEntryProc) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} EntryInfo The structure that contains specific provider info. The Type of <i>EntryInfo</i> is provider-specific.  For WOF_PROVIDER_WIM,
     * it will be PWIM_ENTRY_INFO.
     * @param {Pointer<Void>} _UserData Optional user defined data specified in the call to <a href="https://docs.microsoft.com/windows/desktop/api/wofapi/nf-wofapi-wofenumentries">WofEnumEntries</a>.
     * @returns {BOOL} A boolean value that indicates whether the enumeration was successful. The enumeration will stop if this callback function returns FALSE.
     */
    Call(EntryInfo, _UserData) {
        EntryInfoMarshal := EntryInfo is VarRef ? "ptr" : "ptr"
        _UserDataMarshal := _UserData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, EntryInfoMarshal, EntryInfo, _UserDataMarshal, _UserData, BOOL)
        return result
    }

    /**
     * A WofEnumEntryProc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WofEnumEntryProc {
        /**
         * Creates a WofEnumEntryProc pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
