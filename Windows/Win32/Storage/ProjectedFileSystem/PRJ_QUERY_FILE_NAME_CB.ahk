#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRJ_CALLBACK_DATA.ahk" { PRJ_CALLBACK_DATA }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Determines whether a given file path exists in the provider's backing store.
 * @remarks
 * This callback is optional.  If the provider does not supply an implementation of this callback, ProjFS will invoke the provider’s directory enumeration callbacks to determine the existence of a file path in the provider's store.
 * 
 * The provider should use <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjfilenamecompare">PrjFileNameCompare</a> as the comparison routine when searching its backing store for the specified file.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nc-projectedfslib-prj_query_file_name_cb
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_QUERY_FILE_NAME_CB {
    value : IntPtr

    __value {
        set {
            if (value is PRJ_QUERY_FILE_NAME_CB) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<PRJ_CALLBACK_DATA>} callbackData Information about the operation.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The queried file path exists in the provider's store.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The queried file path does not exist in the provider's store.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_IO_PENDING)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider wishes to complete the operation at a later time. 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * An appropriate HRESULT error code if the provider fails the operation.
     */
    Call(callbackData) {
        result := DllCall(this.value, PRJ_CALLBACK_DATA.Ptr, callbackData, "HRESULT")
        return result
    }

    /**
     * A PRJ_QUERY_FILE_NAME_CB that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRJ_QUERY_FILE_NAME_CB {
        /**
         * Creates a PRJ_QUERY_FILE_NAME_CB pointer that invokes the given AHK function when called.
         * @param {Func(PRJ_CALLBACK_DATA) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PRJ_CALLBACK_DATA.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
