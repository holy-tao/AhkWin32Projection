#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PRJ_CALLBACK_DATA.ahk" { PRJ_CALLBACK_DATA }
#Import ".\PRJ_DIR_ENTRY_BUFFER_HANDLE.ahk" { PRJ_DIR_ENTRY_BUFFER_HANDLE }

/**
 * Requests directory enumeration information from the provider.
 * @remarks
 * ProjFS invokes this callback one or more times after invoking <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_start_directory_enumeration_cb">PRJ_START_DIRECTORY_ENUMERATION_CB</a>.  See the Remarks section of <i>PRJ_START_DIRECTORY_ENUMERATION_CB</i> for more information.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nc-projectedfslib-prj_get_directory_enumeration_cb
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_GET_DIRECTORY_ENUMERATION_CB {
    value : IntPtr

    __value {
        set {
            if (value is PRJ_GET_DIRECTORY_ENUMERATION_CB) {
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
     * <dd><b>Flags</b> Flags to control what is returned in the enumeration.  Valid values are:
     * 
     * <table>
     * <tr>
     * <td>PRJ_CB_DATA_FLAG_ENUM_RETURN_SINGLE_ENTRY</td>
     * <td>This bit is set if the user is requesting only one entry from the enumeration.  The provider may treat this as a hint, and may opt to return more than one entry to make an enumeration that returns one item at a time more efficient. 
     * In such a case ProjFS will return single entry to the user, invoking the provider only when it needs more entries.</td>
     * </tr>
     * <tr>
     * <td>PRJ_CB_DATA_FLAG_ENUM_RESTART_SCAN</td>
     * <td>This bit is set if the enumeration is to start at the first entry in the directory.  On the first invocation of this callback for an enumeration session the provider must treat this flag as set, regardless of its value. All enumerations must start at the first entry. 
     * On subsequent invocations of this callback the provider must honor this value.</td>
     * </tr>
     * </table>
     *  
     * 
     * </dd>
     * </dl>
     * 
     * 
     * The provider can access this buffer only while the callback is running. If it wishes to pend the operation and it requires data from this buffer, it must make its own copy of it.
     * @param {Pointer<Guid>} enumerationId An identifier for this enumeration session.
     * @param {PWSTR} searchExpression A pointer to a null-terminated Unicode string specifying a search expression. The search expression may include wildcard characters. The provider should use the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjdoesnamecontainwildcards">PrjDoesNameContainWildCards</a> function to determine whether wildcards are present in <b>searchExpression</b>, and it should use the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjfilenamematch">PrjFileNameMatch</a> function to determine whether an entry in its backing store matches a search expression containing wildcards.
     * 
     * This parameter is optional and may be NULL.<ul>
     * <li>If this parameter is not NULL, the provider must return only those directory entries whose names match the search expression.</li>
     * <li>If this parameter is NULL, the provider must return all directory entries.</li>
     * </ul>
     * 
     * 
     * The provider should capture the value of this parameter on the first invocation of this callback for an enumeration session and use it on subsequent invocations, ignoring this parameter on those invocations unless <b>PRJ_CB_DATA_FLAG_ENUM_RESTART_SCAN</b> is specified in the <b>Flags</b> member of <b>callbackData</b>.  In that case the provider must re-capture the value of <b>searchExpression.</b>
     * @param {PRJ_DIR_ENTRY_BUFFER_HANDLE} dirEntryBufferHandle An opaque handle to a structure that receives the results of the enumeration from the provider. The provider uses the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjfilldirentrybuffer">PrjFillDirEntryBuffer</a> routine to fill the structure.
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
     * The provider successfully added at least one entry to dirEntryBufferHandle, or no entries in the provider’s store match searchExpression. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider received this error from <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjfilldirentrybuffer">PrjFillDirEntryBuffer</a> for the first file or directory it tried to add to dirEntryBufferHandle. 
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
     *  
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
    Call(callbackData, enumerationId, searchExpression, dirEntryBufferHandle) {
        searchExpression := searchExpression is String ? StrPtr(searchExpression) : searchExpression

        result := DllCall(this.value, PRJ_CALLBACK_DATA.Ptr, callbackData, Guid.Ptr, enumerationId, "ptr", searchExpression, PRJ_DIR_ENTRY_BUFFER_HANDLE, dirEntryBufferHandle, "HRESULT")
        return result
    }

    /**
     * A PRJ_GET_DIRECTORY_ENUMERATION_CB that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRJ_GET_DIRECTORY_ENUMERATION_CB {
        /**
         * Creates a PRJ_GET_DIRECTORY_ENUMERATION_CB pointer that invokes the given AHK function when called.
         * @param {Func(PRJ_CALLBACK_DATA, Guid, PWSTR, PRJ_DIR_ENTRY_BUFFER_HANDLE) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PRJ_CALLBACK_DATA.Ptr, Guid.Ptr, PWSTR, PRJ_DIR_ENTRY_BUFFER_HANDLE, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
