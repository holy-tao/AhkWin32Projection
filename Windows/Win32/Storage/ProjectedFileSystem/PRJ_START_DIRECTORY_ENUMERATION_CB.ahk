#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRJ_CALLBACK_DATA.ahk" { PRJ_CALLBACK_DATA }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Informs the provider that a directory enumeration is starting.
 * @remarks
 * ProjFS requests a directory enumeration from the provider by first invoking this callback, then one or more <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_directory_enumeration_cb">PRJ_GET_DIRECTORY_ENUMERATION_CB</a> callbacks, then the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_end_directory_enumeration_cb">PRJ_END_DIRECTORY_ENUMERATION_CB</a> callback. Because multiple enumerations may occur in parallel in the same location, ProjFS uses the <i>enumerationId</i> argument to associate the callback invocations into a single enumeration session, meaning that a given set of calls to the enumeration callbacks will use the same value for <i>enumerationId</i> for the same session.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nc-projectedfslib-prj_start_directory_enumeration_cb
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_START_DIRECTORY_ENUMERATION_CB {
    value : IntPtr

    __value {
        set {
            if (value is PRJ_START_DIRECTORY_ENUMERATION_CB) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<PRJ_CALLBACK_DATA>} callbackData Information about the operation. The following <i>callbackData</i> members are necessary to implement this callback:<dl>
     * <dd><b>FilePathName</b> Identifies the directory to be enumerated.
     * 
     * </dd>
     * <dd><b>VersionInfo</b> Provides version information for the directory to be enumerated.
     * 
     * </dd>
     * </dl>
     * 
     * 
     * The provider can access this buffer only while the callback is running. If it wishes to pend the operation and it requires data from this buffer, it must make its own copy of it.
     * @param {Pointer<Guid>} enumerationId An identifier for this enumeration session.
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
     * The provider successfully completed the operation.
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
     * The directory to be enumerated does not exist in the provider’s backing store. 
     * 
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
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * An appropriate HRESULT error code if the provider fails the operation.
     */
    Call(callbackData, enumerationId) {
        result := DllCall(this.value, PRJ_CALLBACK_DATA.Ptr, callbackData, Guid.Ptr, enumerationId, "HRESULT")
        return result
    }

    /**
     * A PRJ_START_DIRECTORY_ENUMERATION_CB that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRJ_START_DIRECTORY_ENUMERATION_CB {
        /**
         * Creates a PRJ_START_DIRECTORY_ENUMERATION_CB pointer that invokes the given AHK function when called.
         * @param {Func(PRJ_CALLBACK_DATA, Guid) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PRJ_CALLBACK_DATA.Ptr, Guid.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
