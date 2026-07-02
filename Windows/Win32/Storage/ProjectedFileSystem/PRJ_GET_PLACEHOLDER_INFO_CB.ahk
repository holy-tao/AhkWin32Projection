#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRJ_CALLBACK_DATA.ahk" { PRJ_CALLBACK_DATA }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Requests information for a file or directory from the provider.
 * @remarks
 * ProjFS will use the information provided in this callback to create a placeholder for the requested item. 
 * 
 * 
 * To handle this callback, the provider calls <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjwriteplaceholderinfo">PrjWritePlaceholderInfo</a> to give ProjFS the information for the requested file name. Then the provider completes the callback.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_GET_PLACEHOLDER_INFO_CB {
    value : IntPtr

    __value {
        set {
            if (value is PRJ_GET_PLACEHOLDER_INFO_CB) {
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
     * <dd><b>FilePathName</b> Identifies the path to the file or directory in the provider's store for which ProjFS is requesting information.
     * 
     * The provider uses this to determine whether the name exists in its backing store.  It should use the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjfilenamematch">PrjFileNameMatch</a> function to compare this name to the names in its store.  If it finds a matching name, it uses that name as the <i>destinationFileName</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjwriteplaceholderinfo">PrjWritePlaceholderInfo</a> function.
     * 
     * </dd>
     * <dd><b>VersionInfo</b> Provides version information for the parent directory of the requested item.
     * 
     * </dd>
     * </dl>
     * 
     * 
     * The provider can access this buffer only while the callback is running. If it wishes to pend the operation and it requires data from this buffer, it must make its own copy of it.
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
     * The file exists in the provider's store and it successfully gave the file's information to ProjFS.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file does not exist in the provider's store. 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Another appropriate HRESULT error code if the provider fails the operation.
     */
    Call(callbackData) {
        result := DllCall(this.value, PRJ_CALLBACK_DATA.Ptr, callbackData, "HRESULT")
        return result
    }

    /**
     * A PRJ_GET_PLACEHOLDER_INFO_CB that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRJ_GET_PLACEHOLDER_INFO_CB {
        /**
         * Creates a PRJ_GET_PLACEHOLDER_INFO_CB pointer that invokes the given AHK function when called.
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
