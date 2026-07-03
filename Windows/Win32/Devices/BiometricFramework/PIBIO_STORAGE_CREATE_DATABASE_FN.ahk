#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Creates and configures a new database.
 * @remarks
 * The biometric service calls this method if the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_open_database_fn">StorageAdapterOpenDatabase</a> function fails and if an <b>AutoCreate</b> flag has been associated with the database in the registry.
 * 
 * If this function succeeds, the database must be left in the open state. The Windows Biometric Framework will not issue a subsequent call to this function.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_storage_create_database_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_STORAGE_CREATE_DATABASE_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_STORAGE_CREATE_DATABASE_FN) {
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
     * @param {Pointer<Guid>} DatabaseId Pointer to a GUID that uniquely identifies the database. This is the same GUID used to register the database in the registry.
     * @param {Integer} Factor A WINBIO_BIOMETRIC_TYPE value that specifies the type of the biometric factor stored in this database. Only <b>WINBIO_TYPE_FINGERPRINT</b> is currently supported.
     * @param {Pointer<Guid>} Format Pointer to a GUID that specifies the vendor-defined format of the data in the <b>VendorDataBlock</b> member of the <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir">WINBIO_BIR</a> object.
     * @param {PWSTR} FilePath Pointer to a <b>NULL</b>-terminated Unicode string that contains the fully qualified file path for the database.
     * @param {PWSTR} ConnectString Pointer to a <b>NULL</b>-terminated Unicode connection string for the database.
     * @param {Pointer} IndexElementCount The number of elements in the index vector. This can be equal to or greater than zero.
     * @param {Pointer} InitialSize A value that contains the beginning size of the  database, in bytes.
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
    Call(Pipeline, DatabaseId, Factor, Format, FilePath, ConnectString, IndexElementCount, InitialSize) {
        FilePath := FilePath is String ? StrPtr(FilePath) : FilePath
        ConnectString := ConnectString is String ? StrPtr(ConnectString) : ConnectString

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, Guid.Ptr, DatabaseId, UInt32, Factor, Guid.Ptr, Format, "ptr", FilePath, "ptr", ConnectString, IntPtr, IndexElementCount, IntPtr, InitialSize, "HRESULT")
        return result
    }

    /**
     * A PIBIO_STORAGE_CREATE_DATABASE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_STORAGE_CREATE_DATABASE_FN {
        /**
         * Creates a PIBIO_STORAGE_CREATE_DATABASE_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, Guid, UInt32, Guid, PWSTR, PWSTR, IntPtr, IntPtr) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, Guid.Ptr, UInt32, Guid.Ptr, PWSTR, PWSTR, IntPtr, IntPtr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
