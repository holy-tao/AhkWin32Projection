#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_IDENTITY.ahk" { WINBIO_IDENTITY }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Deletes one or more templates from the database.
 * @remarks
 * If the <b>Type</b> field of the <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure pointed to by the <i>Identity</i> parameter is set to <b>WINBIO_IDENTITY_TYPE_WILDCARD</b> and the <i>SubFactor</i> parameter equals <b>WINBIO_SUBTYPE_ANY</b>, the storage adapter should delete all records from the database.
 * 
 * <div class="alert"><b>Important</b>  <p class="note">Do not attempt to validate the value supplied for the <i>SubFactor</i> parameter. The Windows Biometrics Service will validate the supplied value before passing it through to your implementation. If the value is <b>WINBIO_SUBTYPE_NO_INFORMATION</b> or <b>WINBIO_SUBTYPE_ANY</b>, then validate where appropriate.
 * 
 * </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_storage_delete_record_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_STORAGE_DELETE_RECORD_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_STORAGE_DELETE_RECORD_FN) {
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
     * @param {Pointer<WINBIO_IDENTITY>} Identity Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that contains the GUID or SID of the template to delete.
     * @param {Integer} SubFactor A <b>WINBIO_BIOMETRIC_SUBTYPE</b> value that specifies the sub-factor associated with the template to delete.
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
     * The argument specified by the <i>SubFactor</i> parameter is not valid or a member of the structure specified by the <i>Identity</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory could not be allocated for the record header.
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
     * <dt><b><b>WINBIO_E_DATABASE_NO_SUCH_RECORD</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No matching record could be found in the database.
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
    Call(Pipeline, Identity, SubFactor) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, WINBIO_IDENTITY.Ptr, Identity, Int8, SubFactor, "HRESULT")
        return result
    }

    /**
     * A PIBIO_STORAGE_DELETE_RECORD_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_STORAGE_DELETE_RECORD_FN {
        /**
         * Creates a PIBIO_STORAGE_DELETE_RECORD_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, WINBIO_IDENTITY, Int8) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, WINBIO_IDENTITY.Ptr, Int8, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
