#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WINBIO_STORAGE_RECORD.ahk" { WINBIO_STORAGE_RECORD }

/**
 * Retrieves the contents of the current record in the pipeline result set.
 * @remarks
 * Any addresses returned by this function in the WINBIO_STORAGE_RECORD structure must remain valid until one of the following functions is called:
 * 
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_first_record_fn">StorageAdapterFirstRecord</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_next_record_fn">StorageAdapterNextRecord</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_query_by_content_fn">StorageAdapterQueryByContent</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_query_by_subject_fn">StorageAdapterQueryBySubject</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_clear_context_fn">StorageAdapterClearContext</a>
 * </li>
 * </ul>
 * Calling the <i>StorageAdapterGetCurrentRecord</i> function does not change the result set pointer. If the pointer is already on the last record in the set, repeatedly calling this function will return the same record contents and an <b>HRESULT</b> value of S_OK.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_storage_get_current_record_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_STORAGE_GET_CURRENT_RECORD_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_STORAGE_GET_CURRENT_RECORD_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline">WINBIO_PIPELINE</a> structure associated with the biometric unit performing the operation.
     * @param {Pointer<WINBIO_STORAGE_RECORD>} RecordContents Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_storage_record">WINBIO_STORAGE_RECORD</a> structure that will receive the contents of the record.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it must return one of the following <b>HRESULT</b> values to indicate the error.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory could not be allocated for the record.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A mandatory pointer argument is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_DATABASE_NO_RESULTS</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no records in the result set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_INVALID_DEVICE_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>StorageContext</b> member of the pipeline object is <b>NULL</b> or the <b>FileHandle</b> member is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Pipeline, RecordContents) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, WINBIO_STORAGE_RECORD.Ptr, RecordContents, "HRESULT")
        return result
    }

    /**
     * A PIBIO_STORAGE_GET_CURRENT_RECORD_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_STORAGE_GET_CURRENT_RECORD_FN {
        /**
         * Creates a PIBIO_STORAGE_GET_CURRENT_RECORD_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, WINBIO_STORAGE_RECORD) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, WINBIO_STORAGE_RECORD.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
