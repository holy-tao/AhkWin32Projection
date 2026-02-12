#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Notifies the Engine Adapter that it should discard any cached templates that it may be keeping in memory.
 * @remarks
 * An Engine Adapter that maintains a private in-memory cache of templates (e.g., for performance reasons) should discard the contents of its cache when it receives this method call. The call indicates that the cache contents are no longer valid. Depending on the Engine Adapter’s cache policy, the adapter may also choose to reload its cache at this time from the template database.
 * 
 * The biometric service calls this method in the following situations:<ul>
 * <li>
 * Once, when the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_attach_fn">StorageAdapterAttach</a> routine has successfully opened its connection to the template database.
 * 
 * </li>
 * <li>
 * Again, after performing any operation that changes the state of the template database. <ul>
 * <li>
 * Adding a new template to the database.
 * 
 * </li>
 * <li>
 * Deleting one or more existing templates from the database.
 * 
 * </li>
 * </ul>
 * 
 * 
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_refresh_cache_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_REFRESH_CACHE_FN extends IUnknown {

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
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline) {
        result := ComCall(3, this, "ptr", Pipeline, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
