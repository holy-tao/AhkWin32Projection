#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Queries the database that is currently open for templates associated with a specified index vector.
 * @remarks
 * If this method returns successfully, the result set in the pipeline is replaced by the results of the query even if the query returns an empty set.
 * 
 * If the database was created with a zero length index vector, the result set will contain every record for which the template sub factor matches the <i>SubFactor</i> parameter. In that case, if the caller passes WINBIO_SUBTYPE_ANY for the <i>SubFactor</i> parameter, this function returns all records in the database.
 * 
 * After a successful call to this function, the result set cursor should be  positioned on the first record in the set.
 * 
 * <div class="alert"><b>Important</b>  <p class="note">Do not attempt to validate the value supplied for the <i>SubFactor</i> parameter. The Windows Biometrics Service will validate the supplied value before passing it through to your implementation. If the value is <b>WINBIO_SUBTYPE_NO_INFORMATION</b> or <b>WINBIO_SUBTYPE_ANY</b>, then validate where appropriate.
 * 
 * </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_storage_query_by_content_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_STORAGE_QUERY_BY_CONTENT_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_STORAGE_QUERY_BY_CONTENT_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline">WINBIO_PIPELINE</a> structure associated with the biometric unit performing the operation.
     * @param {Integer} SubFactor A <b>WINBIO_BIOMETRIC_SUBTYPE</b> value that specifies the sub-factor associated with the template.
     * @param {Pointer<Integer>} IndexVector 
     * @param {Pointer} IndexElementCount A value that contains the number of elements in the index vector array. This must match the size specified when the database was created. If the database was created with a zero length index, this parameter must be zero.
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
     * The argument specified by the <i>SubFactor</i> parameter is not valid.
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
     * <dt><b><b>WINBIO_E_DATABASE_BAD_INDEX_VECTOR</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the  index vector does not match the index size specified when the database was created.
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
    Call(Pipeline, SubFactor, IndexVector, IndexElementCount) {
        IndexVectorMarshal := IndexVector is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, Int8, SubFactor, IndexVectorMarshal, IndexVector, IntPtr, IndexElementCount, "HRESULT")
        return result
    }

    /**
     * A PIBIO_STORAGE_QUERY_BY_CONTENT_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_STORAGE_QUERY_BY_CONTENT_FN {
        /**
         * Creates a PIBIO_STORAGE_QUERY_BY_CONTENT_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, Int8, "uint*", IntPtr) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, Int8, "uint*", IntPtr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
