#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Callback function that gets called for each file backed by an external data source, such as a WIM file.
 * @see https://learn.microsoft.com/windows/win32/api/wofapi/nc-wofapi-wofenumfilesproc
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct WofEnumFilesProc {
    value : IntPtr

    __value {
        set {
            if (value is WofEnumFilesProc) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} FilePath Specifies the path to the file which is backed by an external data source.
     * @param {Pointer<Void>} ExternalFileInfo Points to a buffer containing information about the data source backing the file.  The type of this buffer depends on the provider; data structures for each provider are:
     * 
     * <table>
     * <tr>
     * <td>WOF_PROVIDER_WIM</td>
     * <td>WIM_EXTERNAL_FILE_INFO</td>
     * </tr>
     * <tr>
     * <td>WOF_PROVIDER_FILE</td>
     * <td>WOF_FILE_COMPRESSION_INFO</td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} _UserData Optional user defined data.
     * @returns {BOOL} A boolean value that indicates whether the enumeration was successful. The enumeration will stop if this callback function returns FALSE.
     */
    Call(FilePath, ExternalFileInfo, _UserData) {
        FilePath := FilePath is String ? StrPtr(FilePath) : FilePath

        ExternalFileInfoMarshal := ExternalFileInfo is VarRef ? "ptr" : "ptr"
        _UserDataMarshal := _UserData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", FilePath, ExternalFileInfoMarshal, ExternalFileInfo, _UserDataMarshal, _UserData, BOOL)
        return result
    }

    /**
     * A WofEnumFilesProc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WofEnumFilesProc {
        /**
         * Creates a WofEnumFilesProc pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, "ptr", "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, "ptr", "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
