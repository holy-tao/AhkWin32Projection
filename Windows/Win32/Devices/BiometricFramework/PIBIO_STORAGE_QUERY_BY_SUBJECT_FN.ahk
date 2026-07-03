#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_IDENTITY.ahk" { WINBIO_IDENTITY }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Queries the database that is currently open for templates associated with a specified identity and sub-factor.
 * @remarks
 * If this method returns successfully, the result set in the pipeline is replaced by the results of the query even if the query returns an empty set.
 * 
 * Callers of this function should be able to  retrieve all records by:
 * 
 * <ul>
 * <li>Passing a <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure in the <i>Identity</i> parameter with the  <b>Type</b> field set to  <b>WINBIO_IDENTITY_TYPE_WILDCARD</b>.</li>
 * <li>Passing <b>WINBIO_SUBTYPE_ANY</b> in the <i>SubFactor</i> parameter.</li>
 * </ul>
 * After a successful call to this function, the result set cursor should be  positioned on the first record in the set.
 * 
 * <div class="alert"><b>Important</b>  <p class="note">Do not attempt to validate the value supplied for the <i>SubFactor</i> parameter. The Windows Biometrics Service will validate the supplied value before passing it through to your implementation. If the value is <b>WINBIO_SUBTYPE_NO_INFORMATION</b> or <b>WINBIO_SUBTYPE_ANY</b>, then validate where appropriate.
 * 
 * </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_storage_query_by_subject_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_STORAGE_QUERY_BY_SUBJECT_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_STORAGE_QUERY_BY_SUBJECT_FN) {
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
     * @param {Pointer<WINBIO_IDENTITY>} Identity Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that contains the GUID or SID to be located. If the <b>Type</b> field of this structure contains <b>WINBIO_IDENTITY_TYPE_WILDCARD</b>, the query returns every template that matches the <i>SubFactor</i> parameter.
     * @param {Integer} SubFactor A <b>WINBIO_BIOMETRIC_SUBTYPE</b> value that specifies the sub-factor to be located. If this value is <b>WINBIO_SUBTYPE_ANY</b>, the query returns every template that matches the <i>Identity</i> parameter.
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
     * The query was successful, but no matching records could be found.
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
     * <dt><b><b>WINBIO_E_DATABASE_READ_ERROR</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified problem occurred.
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
     * A PIBIO_STORAGE_QUERY_BY_SUBJECT_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_STORAGE_QUERY_BY_SUBJECT_FN {
        /**
         * Creates a PIBIO_STORAGE_QUERY_BY_SUBJECT_FN pointer that invokes the given AHK function when called.
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
