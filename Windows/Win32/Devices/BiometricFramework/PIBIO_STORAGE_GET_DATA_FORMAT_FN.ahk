#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WINBIO_VERSION.ahk" { WINBIO_VERSION }

/**
 * Retrieves format and version information used by the current database associated with the pipeline.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_storage_get_data_format_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_STORAGE_GET_DATA_FORMAT_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_STORAGE_GET_DATA_FORMAT_FN) {
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
     * @param {Pointer<Guid>} Format Pointer to a variable that receives a  GUID that uniquely identifies the data format used by this storage adapter when it stores templates in the database.
     * @param {Pointer<WINBIO_VERSION>} _Version Pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-version">WINBIO_VERSION</a>  structure that receives the version number of the storage adapter component.
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
    Call(Pipeline, Format, _Version) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, Guid.Ptr, Format, WINBIO_VERSION.Ptr, _Version, "HRESULT")
        return result
    }

    /**
     * A PIBIO_STORAGE_GET_DATA_FORMAT_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_STORAGE_GET_DATA_FORMAT_FN {
        /**
         * Creates a PIBIO_STORAGE_GET_DATA_FORMAT_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, Guid, WINBIO_VERSION) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, Guid.Ptr, WINBIO_VERSION.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
