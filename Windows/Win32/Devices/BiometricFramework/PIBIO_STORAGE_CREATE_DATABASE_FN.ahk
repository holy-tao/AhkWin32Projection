#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates and configures a new database.
 * @remarks
 * The biometric service calls this method if the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_open_database_fn">StorageAdapterOpenDatabase</a> function fails and if an <b>AutoCreate</b> flag has been associated with the database in the registry.
 * 
 * If this function succeeds, the database must be left in the open state. The Windows Biometric Framework will not issue a subsequent call to this function.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_storage_create_database_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_STORAGE_CREATE_DATABASE_FN extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline 
     * @param {Pointer<Guid>} DatabaseId 
     * @param {Integer} Factor 
     * @param {Pointer<Guid>} Format 
     * @param {PWSTR} FilePath 
     * @param {PWSTR} ConnectString 
     * @param {Pointer} IndexElementCount 
     * @param {Pointer} InitialSize 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, DatabaseId, Factor, Format, FilePath, ConnectString, IndexElementCount, InitialSize) {
        FilePath := FilePath is String ? StrPtr(FilePath) : FilePath
        ConnectString := ConnectString is String ? StrPtr(ConnectString) : ConnectString

        result := ComCall(3, this, "ptr", Pipeline, "ptr", DatabaseId, "uint", Factor, "ptr", Format, "ptr", FilePath, "ptr", ConnectString, "ptr", IndexElementCount, "ptr", InitialSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
