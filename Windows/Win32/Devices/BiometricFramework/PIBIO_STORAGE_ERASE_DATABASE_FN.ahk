#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Erases the database and marks it for deletion.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_storage_erase_database_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_STORAGE_ERASE_DATABASE_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_STORAGE_ERASE_DATABASE_FN) {
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
     * @param {Pointer<Guid>} DatabaseId A pointer to a GUID that uniquely identifies the database. This is the same GUID used to register the database in the registry.
     * @param {PWSTR} FilePath Pointer to a <b>NULL</b>-terminated UNICODE string that contains the fully qualified file path for the database.
     * @param {PWSTR} ConnectString A pointer to a <b>NULL</b>-terminated UNICODE connection string for the database.
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
     * <dt><b>WINBIO_E_DATABASE_CORRUPTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>DatabaseId</i> parameter is not the same as the one used when creating the database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_DATABASE_CANT_FIND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified database cannot be found.
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
    Call(Pipeline, DatabaseId, FilePath, ConnectString) {
        FilePath := FilePath is String ? StrPtr(FilePath) : FilePath
        ConnectString := ConnectString is String ? StrPtr(ConnectString) : ConnectString

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, Guid.Ptr, DatabaseId, "ptr", FilePath, "ptr", ConnectString, "HRESULT")
        return result
    }

    /**
     * A PIBIO_STORAGE_ERASE_DATABASE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_STORAGE_ERASE_DATABASE_FN {
        /**
         * Creates a PIBIO_STORAGE_ERASE_DATABASE_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, Guid, PWSTR, PWSTR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, Guid.Ptr, PWSTR, PWSTR, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
