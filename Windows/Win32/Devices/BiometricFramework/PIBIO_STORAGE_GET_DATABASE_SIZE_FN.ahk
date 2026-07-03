#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Retrieves the database size and available space.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_storage_get_database_size_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_STORAGE_GET_DATABASE_SIZE_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_STORAGE_GET_DATABASE_SIZE_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline">WINBIO_PIPELINE</a> structure associated with the biometric unit performing the operation.
     * @param {Pointer<Pointer>} AvailableRecordCount Pointer to a variable that receives the number of unused record slots in the database.
     * @param {Pointer<Pointer>} TotalRecordCount Pointer to a variable that receives the number of valid records in the database.
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
     * <dt><b>WINBIO_E_INVALID_DEVICE_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>StorageContext</b> member of the pipeline object is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Pipeline, AvailableRecordCount, TotalRecordCount) {
        AvailableRecordCountMarshal := AvailableRecordCount is VarRef ? "ptr*" : "ptr"
        TotalRecordCountMarshal := TotalRecordCount is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, AvailableRecordCountMarshal, AvailableRecordCount, TotalRecordCountMarshal, TotalRecordCount, "HRESULT")
        return result
    }

    /**
     * A PIBIO_STORAGE_GET_DATABASE_SIZE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_STORAGE_GET_DATABASE_SIZE_FN {
        /**
         * Creates a PIBIO_STORAGE_GET_DATABASE_SIZE_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, "ptr*", "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, "ptr*", "ptr*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
