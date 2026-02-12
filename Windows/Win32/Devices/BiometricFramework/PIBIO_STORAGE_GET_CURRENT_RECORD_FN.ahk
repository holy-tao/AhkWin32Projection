#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WINBIO_STORAGE_RECORD.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_storage_get_current_record_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_STORAGE_GET_CURRENT_RECORD_FN extends IUnknown {

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
     * @returns {WINBIO_STORAGE_RECORD} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline) {
        RecordContents := WINBIO_STORAGE_RECORD()
        result := ComCall(3, this, "ptr", Pipeline, "ptr", RecordContents, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RecordContents
    }
}
