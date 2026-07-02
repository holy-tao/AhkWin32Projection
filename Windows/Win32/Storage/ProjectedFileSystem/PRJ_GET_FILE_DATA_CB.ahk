#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRJ_CALLBACK_DATA.ahk" { PRJ_CALLBACK_DATA }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Requests the contents of a file's primary data stream.
 * @remarks
 * When ProjFS receives the data it will write it to the file to convert it into a hydrated placeholder. 
 * 
 * 
 * To handle this callback, the provider issues one or more calls to <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjwritefiledata">PrjWriteFileData</a> to give ProjFS the requested contents of the file's primary data stream. Then the provider completes the callback.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nc-projectedfslib-prj_get_file_data_cb
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_GET_FILE_DATA_CB {
    value : IntPtr

    __value {
        set {
            if (value is PRJ_GET_FILE_DATA_CB) {
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
     * <dd><b>FilePathName</b> Identifies the path to the file in the provider’s backing store for which data should be returned.  Note that this reflects the name the file had when its placeholder was first created.  If it has been renamed since then, <b>FilePathName</b> identifies the original (pre-rename) name, not the current (post-rename) name.
     * 
     * </dd>
     * <dd><b>DataStreamId</b>The unique value to associate with this file stream.  The provider must pass this value in the <i>dataStreamId</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjwritefiledata">PrjWriteFileData</a> when providing file data as part of handling this callback.
     * 
     * </dd>
     * <dd><b>VersionInfo</b> Provides the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ns-projectedfslib-prj_placeholder_version_info">PRJ_PLACEHOLDER_VERSION_INFO</a> information that the provider supplied when it created the placeholder for this file.  This may help the provider determine which version of the file contents to return.  If the file has been renamed and the provider tracks renames, this may also help the provider determine which file’s contents are being requested.
     * 
     * </dd>
     * </dl>
     * 
     * 
     * The provider can access this buffer only while the callback is running. If it wishes to pend the operation and it requires data from this buffer, it must make its own copy of it.
     * @param {Integer} byteOffset Offset of the requested data, in bytes, from the beginning of the file. The provider must return file data starting at or before this offset
     * @param {Integer} length Number of bytes of file data requested. The provider must return at least this many bytes of file data beginning with byteOffset.
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
     * The provider successfully returned all the requested data. 
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
    Call(callbackData, byteOffset, length) {
        result := DllCall(this.value, PRJ_CALLBACK_DATA.Ptr, callbackData, Int64, byteOffset, UInt32, length, "HRESULT")
        return result
    }

    /**
     * A PRJ_GET_FILE_DATA_CB that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRJ_GET_FILE_DATA_CB {
        /**
         * Creates a PRJ_GET_FILE_DATA_CB pointer that invokes the given AHK function when called.
         * @param {Func(PRJ_CALLBACK_DATA, Int64, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PRJ_CALLBACK_DATA.Ptr, Int64, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
