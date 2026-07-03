#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import ".\WINBIO_STORAGE_RECORD.ahk" { WINBIO_STORAGE_RECORD }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Adds a template to the database.
 * @remarks
 * The memory identified by the <i>RecordContents</i> parameter is the property of the Windows Biometric Framework. The storage adapter must not keep a copy of this pointer, or of any pointers contained in the <a href="https://docs.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_storage_record">WINBIO_STORAGE_RECORD</a> structure, after returning from <i>StorageAdapterAddRecord</i>.
 * 
 * 
 * <div class="alert"><b>Important</b>  <p class="note">Do not attempt to validate the value supplied for the <i>SubFactor</i> value of the <i>RecordContents</i> parameter. The Windows Biometrics Service will validate the supplied value before passing it through to your implementation. If the value is <b>WINBIO_SUBTYPE_NO_INFORMATION</b> or <b>WINBIO_SUBTYPE_ANY</b>, then validate where appropriate.
 * 
 * </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_storage_add_record_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_STORAGE_ADD_RECORD_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_STORAGE_ADD_RECORD_FN) {
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
     * @param {Pointer<WINBIO_STORAGE_RECORD>} RecordContents Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_storage_record">WINBIO_STORAGE_RECORD</a> structure that contains the template to add.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A member of the  structure specified by the <i>RecordContents</i> parameter  is not valid.
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
     * <dt><b><b>WINBIO_E_DATABASE_BAD_INDEX_VECTOR</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the  index vector specified in the <a href="https://docs.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_storage_record">WINBIO_STORAGE_RECORD</a> structure does not match the index size specified when the database was created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_DUPLICATE_ENROLLMENT</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The database already contains a template with the combination of values specified by the <i>Identity</i> and <i>SubFactor</i> parameters.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_DATABASE_CORRUPTED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is an unspecified problem with the database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_DATABASE_FULL</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The database is full and no further records can be added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_DATABASE_LOCKED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The database is locked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_DATABASE_WRITE_ERROR</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Record addition failed because of an unspecified problem.
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
     * A PIBIO_STORAGE_ADD_RECORD_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_STORAGE_ADD_RECORD_FN {
        /**
         * Creates a PIBIO_STORAGE_ADD_RECORD_FN pointer that invokes the given AHK function when called.
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
